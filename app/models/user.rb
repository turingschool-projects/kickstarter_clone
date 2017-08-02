class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, presence: true
  validates :email, uniqueness: true, case_sensitive: false
  validates :name, presence: true
  has_many :project_owners
  has_many :projects, through: :project_owners
  has_many :project_backers
  has_many :backed_projects, through: :project_backers, source: :project
  has_many :rewards, through: :project_backers

  def self.biggest_donor(limit = 5)
    User.select("users.*, sum(project_backers.pledge_amount) AS total_pledged")
    .joins(:project_backers)
    .group(:id)
    .order("total_pledged DESC")
    .limit(limit)
  end

  def self.total_pledged(user)
    pledges = ProjectBacker.select("project_backers.user_id, project_backers.pledge_amount")
      .where(user_id: user)

    pledges.pluck(:pledge_amount).reduce(:+)
  end
end

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
    User.find_by_sql(
      <<~END
      select u.id, sum(pb.pledge_amount) as total_pledged
      from users as u
      join project_backers as pb
      	on pb.user_id = u.id
      where u.id = #{user}
      group by 1
      END
    )
    # .where(users: {id: user})
    # .joins(:project_backers)
    # .group(:id)
    # .order("total_pledged DESC")

    #binding.pry
  end
end

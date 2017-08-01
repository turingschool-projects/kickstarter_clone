class Location < ApplicationRecord
  validates :postal_code, presence: true, uniqueness: true
  has_many :projects

  def self.most_active
    Location.joins(:projects).group(:id).order('project.location_id DESC').first
  end
end

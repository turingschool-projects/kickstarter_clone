class Location < ApplicationRecord
  validates :postal_code, presence: true
  has_many :projects
end

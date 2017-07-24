class Project < ApplicationRecord
  validates :name,          presence: true
  validates :github_link,   presence: true
  validates :site_link,     presence: true
  validates :description,   presence: true
  validates :image,         presence: true
end

class Project < ApplicationRecord
  validates :name, :github_link, :site_link, :description, :image, presence: true
end

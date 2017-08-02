class Project < ApplicationRecord
  before_save :full_url
  validates :name, :description, :image, presence: true

  private

  def full_url
    unless self.site_link.include?('http')
      self.site_link.prepend('http://')
    end
    unless self.github_link.include?('http')
      self.github_link.prepend('http://')
    end
  end
end

class Project < ApplicationRecord
  before_save :full_url
  validates_presence_of :name, :description, :image

  private

  def full_url
    if self.site_link && !self.site_link.empty?
      unless self.site_link.include?('http') && self.site_link
        self.site_link.prepend('http://')
      end
    end
    if self.github_link && !self.github_link.empty?
      unless self.github_link.include?('http')
        self.github_link.prepend('http://')
      end
    end
  end
end

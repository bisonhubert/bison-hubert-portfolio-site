class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title,           presence: true,
                              length: { minimum: 5 }
  validates :summary,         presence: true,
                              length: { maximum: 140 }
  validates :text, :image,    presence: true
end
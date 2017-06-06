class Article < ApplicationRecord
  validates :title,   presence: true,
                      length: { minimum: 5 }
  validates :text,    presence: true
  validates :image,   presence: true
  validates :summary, presence: true,
                      length: { maximum: 140 }
end
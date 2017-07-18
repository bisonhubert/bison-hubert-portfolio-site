require 'faker'

FactoryGirl.define do
  factory :project do |f|
    f.name { Faker::RuPaul.quote }
    f.github_link 'www.google.com'
    f.site_link 'www.google.com'
    f.description { Faker::Friends.quote }
    f.image { Faker::Placeholdit.image("6x6") }
  end
end

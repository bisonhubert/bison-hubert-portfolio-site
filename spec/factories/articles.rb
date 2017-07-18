require 'faker'

FactoryGirl.define do
  factory :article do |f|
    f.title { Faker::RuPaul.quote }
    f.text { Faker::Friends.quote }
    f.image { Faker::Placeholdit.image("6x3") }
    f.summary { Faker::Zelda.character }
  end
end
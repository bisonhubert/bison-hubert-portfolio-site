User.destroy_all
Article.destroy_all

User.create({ name: 'test', email: 'test@example.com', password: 'test1234%' })

5.times do |i|
  title = Faker::RuPaul.quote
  text = Faker::Lorem.paragraphs(5) + Faker::Lorem.paragraphs(5)
  summary = Faker::Friends.quote
  image = i % 2 == 1 ? Faker::LoremPixel.image('600x300') : Faker::Fillmurray.image(false, 600, 300)
  Article.create({
    title: title,
    text: text,
    summary: summary,
    image: image
  })
end
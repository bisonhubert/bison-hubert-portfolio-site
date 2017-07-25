User.destroy_all
Article.destroy_all
Project.destroy_all

User.create({ name: 'test', email: 'test@example.com', password: 'test1234%' })

5.times do |i|
  title = Faker::RuPaul.quote
  text = Faker::Lorem.paragraph(5) + Faker::Lorem.paragraph(5)
  summary = Faker::Friends.quote
  image = i % 2 == 1 ? Faker::LoremPixel.image('600x300') : Faker::Fillmurray.image(false, 600, 300)
  Article.create({
    title: title,
    text: text,
    summary: summary,
    image: image
  })

  link = 'www.github.com/bisonhubert'
  Project.create({
    name: title,
    description: text,
    github_link: link,
    site_link: link,
    image: Faker::Fillmurray.image(false, 600, 600)
  })
end
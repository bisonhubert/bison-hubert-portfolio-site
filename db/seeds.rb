User.destroy_all
Article.destroy_all

User.create({name: 'test', email: 'test@example.com', password: 'test1234%'})

5.times do 
  title = Faker::RuPaul.quote
  text = Faker::Friends.quote
  summary = Faker::Zelda.character
  image = Faker::Placeholdit.image("6x3")
  Article.create({
    title: title,
    text: text,
    summary: summary,
    image: image
  })
end
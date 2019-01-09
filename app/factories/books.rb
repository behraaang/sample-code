class BookFactory < BotFactory
  def self.create(author: author = AuthorFactory.create,
      title: title = Faker::Book.title,
      published_on: published_on = Faker::Time.backward(3560, :evening))
    Book.new(author: author, title: title, published_on: published_on)
  end
end

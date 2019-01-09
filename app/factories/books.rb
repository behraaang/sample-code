class BookFactory < BotFactory
  def self.create(author = AuthorFactory.create, title = Faker::Book.title, published_on = Faker::Time.backward(3560, :evening))
    Book.new(author, title, published_on)
  end
end

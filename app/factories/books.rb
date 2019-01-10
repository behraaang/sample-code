class BookFactory < BotFactory
  def self.create(options = {})
    author = options[:author] || AuthorFactory.create
    title = options[:title] || Faker::Book.title
    published_on = options[:published_on] || Faker::Time.backward(3560, :evening)

    Book.new(author, title, published_on)
  end
end

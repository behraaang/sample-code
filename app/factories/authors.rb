class AuthorFactory < BotFactory
  def self.create(name = Faker::Book.author)
    Author.new(name)
  end
end

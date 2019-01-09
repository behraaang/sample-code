class AuthorFactory < BotFactory
  def self.create(name: name = Faker::Book.author)
    Author.new(name: name)
  end
end

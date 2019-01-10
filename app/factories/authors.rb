class AuthorFactory < BotFactory
  def self.create(options = {})
    name = options[:name] || Faker::Book.author

    Author.new(name)
  end
end

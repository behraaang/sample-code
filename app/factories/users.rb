class UserFactory < BotFactory
  def self.create(options = {})
    name = options[:user] || Faker::Name.name

    User.new(name)
  end
end

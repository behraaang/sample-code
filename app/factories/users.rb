class UserFactory < BotFactory
  def self.create(name: name = Faker::Name.name)
    User.new(name: name)
  end
end

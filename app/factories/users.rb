class UserFactory < BotFactory
  def self.create(name = Faker::Name.name)
    User.new(name)
  end
end

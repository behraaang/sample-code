class FollowFactory < BotFactory
  def self.create(user = User.all.sample, author = Author.all.sample)
    Follow.new(user, author)
  end
end

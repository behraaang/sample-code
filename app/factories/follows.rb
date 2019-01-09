class FollowFactory < BotFactory
  def self.create(user: user = User.all.sample, author: author = Author.all.sample)
    Follow.new(user: user, author: author)
  end
end

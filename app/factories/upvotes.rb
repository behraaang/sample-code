class UpvoteFactory < BotFactory
  def self.create(options = {})
    user = options[:user] || User.all.sample
    book = options[:book] || Book.all.sample

    Upvote.new(user, book)
  end
end

class UpvoteFactory < BotFactory
  def self.create(user = User.all.sample, book = Book.all.sample)
    Upvote.new(user,book)
  end
end

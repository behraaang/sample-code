class UpvoteFactory < BotFactory
  def self.create(user: user = User.all.sample, book: book = Book.all.sample)
    Upvote.new(user: user,book: book)
  end
end

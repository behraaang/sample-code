class Upvote < ActiveModel
  attr_accessor :user, :book
  ALL = []
  def initialize(user = User.all.sample, book = Book.all.sample)
    return puts 'The user already upvoted the book!' if
        Upvote.all.select { |uv| uv.book == book && uv.user == user }.any?
    @user = user
    @book = book
    add
  end
end

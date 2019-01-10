class Upvote < ActiveModel
  attr_accessor :user, :book

  def initialize(user: user = User.all.sample, book: book = Book.all.sample)
    return puts 'The user already upvoted the book!' if
        Upvote.all.select { |uv| uv.book == book && uv.user == user }.any?
    @user = user
    @book = book
    add
  end
end

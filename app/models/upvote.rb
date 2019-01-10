class Upvote < ActiveModel
  attr_accessor :user, :book

  def initialize(user, book)
    return puts 'The user already upvoted the book!' if
        Upvote.all.select { |uv| uv.book == book && uv.user == user }.any?
    @user = user
    @book = book
    add
  end

  def to_hash
    {
        user: @user.to_hash,
        book: @book.to_hash
    }
  end
end

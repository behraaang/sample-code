# frozen_string_literal: true

class Upvote < ActiveModel
  attr_accessor :user, :book

  def initialize(user, book)
    @user = user
    @book = book
    add unless Upvote.all.select { |uv| uv.book == book && uv.user == user }.any?
  end

  def to_hash
    {
      user: @user.to_hash,
      book: @book.to_hash
    }
  end
end

class User < ActiveModel
  attr_accessor :name, :last_active
  ALL = []

  def initialize(name)
    @name = name
    @last_active = Time.now
    add
  end

  def upvoted_books
    Upvote.all.select {|uv| uv.user == self }.map(&:book)
  end

  def upvoted_books_authors_books
    Upvote.all.select {|uv| uv.user == self }.map { |uv| uv.book.author.books }.flatten
  end

  def favourite_authors
    Follow.all.select {|f| f.user == self }.map(&:author)
  end

  def favourite_authors_books
    Follow.all.select {|f| f.user == self }.map { |f| f.author.books }.flatten
  end
end

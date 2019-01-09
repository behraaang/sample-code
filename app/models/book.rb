class Book < ActiveModel
  attr_accessor :author, :title, :published_on
  ALL = []
  def initialize(author: author, title: title, published_on: published_on)
    @author = author
    @title = title
    @published_on = published_on
    @author.books << self
    add
  end

  def interested_users
    Upvote.all.select {|uv| uv.book == self }.map(&:user)
  end

  def self.from_time(time)
    Book.all.select { |b| b.published_on >= time}
  end
end

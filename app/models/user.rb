# frozen_string_literal: true

class User < ActiveModel
  attr_accessor :name, :last_active

  def initialize(name)
    @name = name
    @last_active = Time.now
    add
  end

  def upvoted_books
    Upvote.all.select { |uv| uv.user == self }.map(&:book)
  end

  def upvoted_books_authors_books
    Upvote.all.select { |uv| uv.user == self }.map { |uv| uv.book.author.books }.flatten
  end

  def favourite_authors
    Follow.all.select { |f| f.user == self }.map(&:author)
  end

  def favourite_authors_books
    Follow.all.select { |f| f.user == self }.map { |f| f.author.books }.flatten
  end

  def upvote_share_count(user)
    (upvoted_books & user.upvoted_books).count
  end

  def upvote_share_weight(user)
    if user.upvoted_books.count != 0
      (upvote_share_count(user).to_f / user.upvoted_books.count).rationalize
    else
      0
    end
  end

  def recommended_books_from(user)
    user.upvoted_books.inject([]) do |arr, book|
      arr << { book: book,
               weight: upvote_share_weight(user) }
    end
  end

  def recommendation_list
    array = User.all.inject([]) do |arr, user|
      arr << recommended_books_from(user)
    end.flatten
    grouped_array = array.group_by { |hash| hash.values_at :book }
    hashes_array  = grouped_array.map do |book, book_hashes|
      { book: book,
        weight: book_hashes.inject(0) { |sum, book_hash| sum + book_hash[:weight] } }
    end
    hashes_array.sort_by { |book_hash| -book_hash[:weight] }
  end

  def to_hash
    {
      name: @name,
      last_active: @last_active
    }
  end
end

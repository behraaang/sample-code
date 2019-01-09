class User < ActiveModel
  attr_accessor :name, :last_active
  ALL = []

  def initialize(name: name)
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

  def upvote_share_count(user)
    (upvoted_books & user.upvoted_books).count
  end

  def upvote_share_weight(user)
    user.upvoted_books.count != 0 ? (upvote_share_count(user).to_f / user.upvoted_books.count).rationalize : 0
  end

  def recommended_books_from(user)
    user.upvoted_books.inject([]) { |arr, book| arr << {book: book, weight: upvote_share_weight(user) } }
  end

  def recommendation_list
    array = User.all.inject([]) { |arr, user| arr << recommended_books_from(user) }.flatten
    grouped_array = array.group_by { |hash| hash.values_at :book }
    hashes_array  = grouped_array.map { |book, book_hashes| { book: book, weight: book_hashes.inject(0) {|sum, book_hash| sum + book_hash[:weight] } } }
    hashes_array.sort_by { |book_hash| -book_hash[:weight] }
  end
end

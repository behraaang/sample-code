class Feed
  def initialize(user)
    @user = user
  end

  def retrieve
    aggregate_books
    @user.last_active = Time.now
    sort_feed(Book.all, @aggregated_books)
  end

  # Bonus
  def refresh
    aggregate_books
    new_books = Book.from_time(@user.last_active)
    @user.last_active = Time.now
    sort_feed(new_books, @aggregated_books)
  end

  def recommendation_list
    @user.recommendation_list
  end


  private

  def aggregate_books
    @aggregated_books = @user.favourite_authors_books + @user.upvoted_books_authors_books
  end

  def sort_feed(books, aggregated_books)
    books.sort { |b| -(aggregated_books.count(b)) }
  end
end

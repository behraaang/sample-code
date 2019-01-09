module Generators
  class Feed
    def initialize(user)
      @user = user
    end

    def retrieve
      aggregate_books
      @user.last_active = Time.now
      sort_feed(Book.all, @aggregated_books)
    end

    private

    def aggregate_books
      @aggregated_books = @user.favourite_authors_books + @user.upvoted_books_authors_books
    end

    def sort_feed(books, aggregated_books)
      books.sort { |b| -(aggregated_books.count(b)) }
    end
  end
end

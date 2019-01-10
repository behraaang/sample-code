# frozen_string_literal: true

require 'faker'
require 'byebug'
require 'ap'

require './app/models/active_model'
Dir['./app/models/*.rb'].each { |file| require file }
Dir['./app/factories/bot_factory.rb'].each { |file| require file }
Dir['./app/factories/*.rb'].each { |file| require file }
Dir['./app/feed.rb'].each { |file| require file }

puts 'How many users would you like there to be?'
user_count = gets.chomp.to_i
puts 'How many books would you like there to be?'
book_count = gets.chomp.to_i
puts 'How many upvotes would you like there to be?'
upvote_count = gets.chomp.to_i
puts 'How many follows would you like there to be?'
follow_count = gets.chomp.to_i
puts 'How many books would you like there to be before refresh?'
refresh_books_count = gets.chomp.to_i
puts 'How many upvotes would you like there to be before refresh?'
refresh_upvotes_count = gets.chomp.to_i

BotFactory.create_list user_count, :user
BotFactory.create_list book_count, :book
BotFactory.create_list upvote_count, :upvote
BotFactory.create_list follow_count, :follow

user_feed_print = Feed.new(User.first).retrieve.each_with_index.map { |b, i| "#{i + 1}: #{b.to_hash}" }
user_recommendation_print = Feed.new(User.first).recommendation_list.each_with_index.map do |hash, i|
  "#{i + 1}:    #{hash[:weight]}: #{hash[:book].first.to_hash}"
end
File.open('sample_result.txt', 'w') do |f|
  f.puts <<-HEREDOC
  In this sample there were #{user_count} users, #{book_count} books, #{upvote_count} upvotes
  and #{follow_count} follows have been made. The client calls
  the retrieve method for getting a sorted list of books based
  on his/hers follows and upvotes, Here are the retrieved books
  for the First user;
  *********************************
  HEREDOC
  f.puts user_feed_print
  f.puts <<-HEREDOC
  *********************************
  HEREDOC
  refresh_books_count.times do |i|
    BookFactory
      .create(published_on: Time.now + i * 100)
  end
  BotFactory.create_list refresh_upvotes_count, :upvote
  f.puts <<-HEREDOC
  After that #{refresh_books_count} new books and #{refresh_upvotes_count} new upvotes
  were added and the same client will make a request to refresh
  their retrieved sorted list of books, Here is the refreshed
  retrieved books;
  *********************************
  HEREDOC
  user_refresh_print = Feed.new(User.first).refresh.each_with_index.map { |b, i| "#{i + 1}: #{b.to_hash}" }
  f.puts user_refresh_print
  f.puts <<~HEREDOC
      *********************************
      Based on his/her upvotes we could generate a recommended list of
      books and the weights of the recommendation for each one, here
      are the books that have been recommended to the same user;
      *********************************
    -: weight: book
  HEREDOC
  f.puts user_recommendation_print
  f.puts <<-HEREDOC
  *********************************
  Have a nice day ;)
  HEREDOC
end
puts 'Look for sample_result.txt in the root folder :)'

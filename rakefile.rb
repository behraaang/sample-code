require 'faker'
require 'byebug'
require 'ap'

require './app/models/active_model'
Dir["./app/models/*.rb"].each {|file| require file }
Dir["./app/factories/bot_factory.rb"].each {|file| require file }
Dir["./app/factories/*.rb"].each {|file| require file }
Dir["./app/feed.rb"].each {|file| require file }

puts 'How many users would you like there to be?'
user_count = gets.chomp.to_i
puts 'How many books would you like there to be?'
book_count = gets.chomp.to_i
puts 'How many upvotes would you like there to be?'
upvote_count = gets.chomp.to_i
puts 'How many follows would you like there to be?'
follow_count = gets.chomp.to_i
puts 'How many follows would you like there to be before refresh?'
refresh_books_count = gets.chomp.to_i
puts 'How many upvotes would you like there to be before refresh?'
refresh_upvotes_count = gets.chomp.to_i

BotFactory.create_list user_count, :user
BotFactory.create_list book_count, :book
BotFactory.create_list upvote_count, :upvote
BotFactory.create_list follow_count, :follow

File.open('sample_result.txt', 'w') do |f|
  f.puts 'Hello'

  f.puts '*********************************'
  f.puts 'Here is the retrieved books for the first user'
  f.puts Feed.new(User.first).retrieve.awesome_inspect
  f.puts '*********************************'

  f.puts '*********************************'
  refresh_books_count.times { |i| BookFactory.create(published_on: Time.now + i * 100) }
  BotFactory.create_list refresh_upvotes_count, :upvote
  f.puts 'Here is the refreshed retrieved books for the first user'
  f.puts Feed.new(User.first).refresh.awesome_inspect
  f.puts '*********************************'

  f.puts '*********************************'
  f.puts 'And here is the recommended list of books with'
  f.puts 'recommendation weights for the first user'
  f.puts Feed.new(User.first).recommendation_list
  f.puts '*********************************'
end

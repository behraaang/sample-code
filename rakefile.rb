require 'faker'
require 'byebug'
require 'ap'
Dir["./app/models/*.rb"].each {|file| require file }
Dir["./app/factories/bot_factory.rb"].each {|file| require file }
Dir["./app/factories/*.rb"].each {|file| require file }
Dir["./app/feed.rb"].each {|file| require file }


BotFactory.create_list 30, :user
BotFactory.create_list 30, :book
BotFactory.create_list 400, :upvote
BotFactory.create_list 200, :follow

ap Feed.new(User.first).retrieve

10.times { |i| BookFactory.create(published_on: Time.now + i * 300) }

ap Feed.new(User.first).refresh

ap Feed.new(User.first).recommendation_list

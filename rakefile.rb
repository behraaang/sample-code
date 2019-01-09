require 'faker'
require 'byebug'
require 'ap'
Dir["./app/models/*.rb"].each {|file| require file }
Dir["./app/factories/bot_factory.rb"].each {|file| require file }
Dir["./app/factories/*.rb"].each {|file| require file }
Dir["./app/feed.rb"].each {|file| require file }


BotFactory.create_list 10, :user
BotFactory.create_list 10, :book
BotFactory.create_list 20, :upvote
BotFactory.create_list 20, :follow

ap Feed.new(User.first).retrieve

ap Feed.new(User.first).recommendation_list

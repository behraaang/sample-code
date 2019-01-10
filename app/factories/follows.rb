# frozen_string_literal: true

class FollowFactory < BotFactory
  def self.create(options = {})
    user = options[:user] || User.all.sample
    author = options[:author] || Author.all.sample

    Follow.new(user, author)
  end
end

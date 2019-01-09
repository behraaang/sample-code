class Follow < ActiveModel
  attr_accessor :user, :author
  ALL = []
  def initialize(user: user = User.all.sample, author: author = Author.all.sample)
    return puts 'The user already follows the author!' if
        Follow.all.select { |f| f.author == author && f.user == user }.any?
    @user = user
    @author = author
    add
  end
end

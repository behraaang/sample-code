class Follow < ActiveModel
  attr_accessor :user, :author

  def initialize(user, author)
    return puts 'The user already follows the author!' if
        Follow.all.select { |f| f.author == author && f.user == user }.any?
    @user = user
    @author = author
    add
  end

  def to_hash
    {
        user: @user.to_hash,
        author: @author.to_hash
    }
  end
end

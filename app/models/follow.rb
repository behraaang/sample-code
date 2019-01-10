# frozen_string_literal: true

class Follow < ActiveModel
  attr_accessor :user, :author

  def initialize(user, author)
    @user = user
    @author = author
    add unless Follow.all.select { |f| f.author == author && f.user == user }.any?
  end

  def to_hash
    {
      user: @user.to_hash,
      author: @author.to_hash
    }
  end
end

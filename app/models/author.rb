# frozen_string_literal: true

class Author < ActiveModel
  attr_accessor :name

  def initialize(name)
    @name = name
    add
  end

  def books
    Book.all.select { |b| b.author == self }
  end

  def followers
    Follow.all.select { |f| f.author == self }.map(&:user)
  end

  def to_hash
    {
      name: @name
    }
  end
end

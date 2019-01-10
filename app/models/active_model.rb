# frozen_string_literal: true

class ActiveModel
  class << self
    def all
      @all ||= []
    end

    def first
      all.first
    end

    def count
      all.count
    end
  end

  protected

  def add
    all << self
  end

  private

  def all
    self.class.all
  end
end

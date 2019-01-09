require_relative './factory'

class BotFactory
  extend Factory

  def self.create(klass)
    Object.const_get(klass.to_s.capitalize.concat('Factory')).create
  end
end

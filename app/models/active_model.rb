class ActiveModel
  def self.all
    self::ALL
  end

  def self.first
    all.first
  end

  def self.count
    all.count
  end

  def add
    self.class::ALL << self
  end
end

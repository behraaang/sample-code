module Factory
  def create_list(count, klass)
    count.times { Object.const_get(klass.to_s.capitalize.concat('Factory')).create }
  end
end

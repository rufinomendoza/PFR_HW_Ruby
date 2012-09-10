class Array
  def our_map(&block)
    new_array = []
    self.each do |value|
      new_array << yield(value)
    end
  new_array
  end

  def our_select(&block)
    new_array = []
    self.each do |value|
      new_array << value if yield(value)
    end
  new_array
  end

  def our_reject(&block)
    new_array = []
    self.each do |value|
      new_array << value unless yield(value)
    end
  new_array
  end

  def our_detect(&block)
    self.each do |value|
      return value if yield(value)
    end
  nil
  end

  def our_inject(&block)
    puts "not this time"
  end

  def sum
    sum = 0
    self.each do |value|
      sum += value
    end
    sum
  end

end

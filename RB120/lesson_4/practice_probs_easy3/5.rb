class Television
  def self.manufacturer
		# method logic
  end

  def model
		# method logic
  end
end

tv = Television.new
tv.manufacturer  # NoMethodError - undefined method `manufacturer` method for
# instance of class `Television`
tv.model  # this works

Television.manufacturer  # this works
Television.model  # NoMethodError - undefined method `model` for class `Television`
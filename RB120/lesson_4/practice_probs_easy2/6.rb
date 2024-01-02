class Television
  def self.manufacturer
		# method logic
  end

  def model
		# method logic
  end
end

# `self.manufacturer` is a class method because it is prepended with `self` and
# is defined within the class `Television`.

# We call a class method by prepending the class name to the method call.

sony = Television.new
Television.manufacturer
class Computer
  attr_accessor :template

  def create_template
		@template = "template 14231"
	end

  def show_template
    template  # `template` references the `template` getter method
  end
end

# class Computer
#   attr_accessor :template

#   def create_template
# 		@template = "template 14231"
# 	end

#   def show_template
# 		self.template  # `self.template` references the `template` getter method invoked on the calling object
#   end
# end

# These two codes should work in the same way. `self.template` just explicitly
# shows that `template` is invoked on the calling object.

mac = Computer.new
mac.create_template
p mac.show_template
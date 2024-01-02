class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# The class `Pizza` would create objects that would have an instance variable
# because instance variables using the syntax `@` prepended to the variable
# name.

apple = Fruit.new("apple")
hot_pizza = Pizza.new("cheese")

p apple.instance_variables      # => []
p hot_pizza.instance_variables  # => [:@name]
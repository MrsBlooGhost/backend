# module Greet
#   def greet(message)
#     puts message
#   end
# end

# class Teacher
#   include Greet
# end

# class Student
#   include Greet
# end

# tom = Teacher.new
# rob = Student.new

# tom.greet "Bonjour!"
# rob.greet "Hello!"

=begin
Interface inheritance is demonstrated here. Ruby does not support multiple inheritance, but it does support interface inheritance, which gives a class access to behavior defined in one or more modules. One or more related methods may be defined in a module, which is then made available to a class via the keyword "include". These modules are called "mixin modules". Typically, interface inheritance is chosen over class inheritance when a class's relationship with the behavior defined is a "has-a" relationship rather than an "is-a" relationship. In this case, both teachers and students "have-an" ability to greet.
=end


class Demographics
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
    @hi = 'a'
  end

  def info
    puts "#{name} weighs at least 150 lb." if weight >= 150
    puts "#{name} weighs less than 150 lb." unless weight >= 150
  end

  private

  attr_reader :weight
end

molly = Demographics.new("Molly", 200)

molly.weight # => in `<main>': private method `weight' called for #<Demographics:0x00007f160de48818 @name="Molly", @height=60, @weight=200> (NoMethodError)

molly.info
# => "Molly is 60 inches inches tall and weighs at least 150 lb."
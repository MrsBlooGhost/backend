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


# 17Q — What does each self refer to in the code snippet below?

# class MeMyselfAndI
#   self

#   def self.me
#     self
#   end

#   def myself
#     self
#   end
# end

# i = MeMyselfAndI.new

# # -------------------------

# #17A

# class MeMyselfAndI
#   self # MeMyselfAndI

#   def self.me
#     self #MeMyselfAndI
#   end

#   def myself
#     self # instance of class MeMyselfAndI
#   end
# end

# i = MeMyselfAndI.new

# Depending on the context in which `self` is used, it refers to different things. If used within a class definition and outside of an instance method, `self` refers to the class. If used within a class definition and inside of an instance method, `self` refers to the instance of the class.

# On line _, `self` refers to class `MeMyselfAndI`.

# On line _, `self` refers to class `MeMyselfAndI`.

# On line _, `self` refers to class `MeMyselfAndI`.

# On line _, `self` refers to an instance of the class `MeMyselfAndI`, which is the receiver of the method `myself`.


# 14 — Write 3 methods inside the Person class and one method in the Friend class that would return the outputs shown on lines 23 and 24.
# (question edited/improved by @bboinay and @dchae)

class Person
  attr_reader :friends

  def initialize
    @friends = []
  end

  def <<(friend)
    @friends << friend
  end

  def []=(idx, friend)
    @friends[idx] = friend
  end

  def [](idx)
    @friends[idx]
  end
end

class Friend
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

tom = Person.new
john = Friend.new('John')
amber = Friend.new('Amber')

tom << amber
tom[1] = john
puts tom[0]      # => Amber
puts tom.friends # => Amber
                 # => John
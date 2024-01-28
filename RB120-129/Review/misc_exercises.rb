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


# 15 — What do the last two lines of code output?

class Foo
  @@var = 1

  def self.var
    @@var
  end
end

class Bar < Foo
  @@var = 2
end

puts Foo.var # 2
puts Bar.var # 2
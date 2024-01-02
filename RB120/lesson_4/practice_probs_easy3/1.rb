class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# Case 1
hello = Hello.new
hello.hi  # Output: Hello

# Case 2
hello = Hello.new
hello.bye  # NoMethodError - undefined method `bye` for `Hello` class object

# Case 3
hello = Hello.new
hello.greet  # ArgumentError - wrong number of arguments (expecting 1, given 0)

# Case 4
hello = Hello.new
hello.greet("Goodbye")  # Output: Goodbye

# Case 5
Hello.hi  # NoMethodError - undefined method `hi` for `Hello` class
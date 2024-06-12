# ------------ Solution by Diana

def execute(&block)
  block
end

p execute { puts "Hello from inside the execute method!" }

# Nothing is output and a `Proc` object is returned. This is because we do not activate the block with the `.call` method.

# ------- Solution by Launch School

# Nothing is printed to the screen because the block is never activated with the `.call` method. The method returns a Proc object.
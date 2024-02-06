# ------------ Solution by Diana

# We need to append an ampersand to `block` when defining the parameter. This tells Ruby to expect a block as an argument upon method invocation.

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# ------- Solution by Launch School

# The method parameter block is missing the ampersand sign `&` that allows a block to be passed as a parameter.
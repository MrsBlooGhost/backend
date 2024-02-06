# ------------ Solution by Diana

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

# ------- Solution by Launch School

def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
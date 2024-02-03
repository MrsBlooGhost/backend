def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# output:
# => #<Proc:0x00000000029c75a0@2.rb:5>
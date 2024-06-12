# -------------- Solution by Diana

x = 0
3.times do
  x += 1
end
puts x  # output: 3

y = 0
3.times do
  y += 1
  x = y
end
puts x  # => undefined local variable or method `x' for main:Object (NameError)

The first `x` prints `3` to the screen, but the second `x` raises a NoMethodError. This is due to variable scoping rules pertaining to blocks. Specifically, a block is defined by `do/end` keywords following a method invocation. If a local variable is initialized outside of a block, it is accessible inside of the block. However, if a local variable is initialzed inside a block, it is not accessible outside the block. 

# ---------- Solution by Launch School

The first prints `3` to the screen. The second throws an error undefined local variable or method because `x` is not available as it is created within the scope of the do/end block.
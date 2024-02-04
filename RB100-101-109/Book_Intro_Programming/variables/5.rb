# Example 1
x = 0
3.times do
  x += 1
end
puts x
# # output:
# # 3


# Example 2
y = 0
3.times do
  y += 1
  x = y
end
puts x
# An error will be generated because `x` was initialized in a block. `x` is
# therefore not accessible outside of the block.
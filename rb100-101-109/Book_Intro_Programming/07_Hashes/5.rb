# -------------- Solution by Diana

# `Hash#value?` or `Hash#has_value?`

directions = {north: "up", south: "down"}

directions.value?("up") # => true
directions.has_value?("right") # => false

# ---------- Solution by Launch School

# value?

opposites = {positive: "negative", up: "down", right: "left"}

if opposites.value?("negative")
  puts "Got it!"
else
  puts "Nope!"
end

# Output:
# Got it!

if opposites.value?("positive")
  puts "Got it!"
else
  puts "Nope!"
end

# Output:
# Nope!
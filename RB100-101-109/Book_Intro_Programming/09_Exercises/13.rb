# -------------- Solution by Diana

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |str| str.start_with?("s")}
arr # => ["winter", "ice", "white trees"]

arr.prepend('snow')
arr.insert(3, 'slippery', 'salted roads')
arr # => ["snow", "winter", "ice", "slippery", "salted roads", "white trees"]

arr.delete_if { |str| str.start_with?("s", "w") }
arr # => ["ice"]

# ---------- Solution by Launch School

arr.delete_if { |str| str.start_with?("s") }

# -- Using logical `or` operator
arr.delete_if { |str| str.start_with?("s") || str.start_with?("w") }

# -- Using `String#start_with?`
arr.delete_if { |str| str.start_with?("s", "w") }
# -------------- Solution by Diana

arr = [15, 7, 18, 5, 12, 8, 5, 1]

arr.index(5) # => 3

arr.index[5] # => NoMethodError: undefined method `[]' for Enumerator

arr[5] # => 8

# ---------- Solution by Launch School

1. 3
2. NoMethodError: undefined method `[]' for #<Enumerator: [15, 7, 18, 5, 12, 8, 5, 1]:index>
  from (irb):81
  from /usr/local/rvm/rubies/ruby-2.5.3/bin/irb:16:in `<main>'
3. 8
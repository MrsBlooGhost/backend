# -------------- Solution by Diana

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# -- Using `Integer#odd?`
odd_nums = arr.select { |num| num.odd? }

# -- Using `Numeric#%`
odd_nums = arr.select { |num| num % 2 != 0 }

# ---------- Solution by Launch School

# one line version
new_array = arr.select { |number| number % 2 != 0 }

# multi-line version
new_array = arr.select do |number|
  number % 2 != 0
end

# -- Using `Integer%odd?`
new_array = arr.select do |number|
  number.odd?
end
# -------------- Solution by Diana

# Using `Array#each`
arr = [2, 4, 6]
new_arr = []

arr.each { |num| new_arr << num + 2 }

p arr
p new_arr

# Using `Enumerable#map`

arr = [2, 4, 6]
new_arr = arr.map { |num| num + 2 }

p arr
p new_arr

# ---------- Solution by Launch School

# Using `Array#each`

arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each do |n|
  new_arr << n + 2
end

p arr
p new_arr

# Using `Enumerable#map`

arr = [1, 2, 3, 4, 5]

new_arr = arr.map do |n|
  n + 2
end

p arr
p new_arr

# -------------- Solution by Diana

arr = [1, 3, 5, 7, 9, 11]
number = 3

puts "The number #{number} appears in the array #{arr}." if arr.include?(number)

# ---------- Solution by Launch School

# -- Using `Array#each`
arr.each do |num|
  if num == number
    puts "#{number} is in the array."
  end
end

# -- Using `Array#include?`
if arr.include?(number)
  puts "#{number} is indeed in the array."
end
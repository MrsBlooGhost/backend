arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |x|
  puts "#{number} appears in the array" if x == number
end

p arr.include?(number)
# -------------- Solution by Diana

puts "Enter a number between 0 and 100:"
num = gets.to_i

if num >= 0 && num <= 50
  puts "The number is between 0 and 50."
elsif num > 50 && num <= 100
  puts "The number is between 51 and 100."
elsif num > 100
  puts "The number is above 100."
end

# ---------- Solution by Launch School

# evaluate_num.rb

puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

if number < 0
  puts "You can't enter a negative number!"
elsif number <= 50
  puts "#{number} is between 0 and 50"
elsif number <= 100
  puts "#{number} is between 51 and 100"
else
  puts "#{number} is above 100"
end
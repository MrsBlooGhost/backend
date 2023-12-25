# puts "the value of 40 + 2 is " + (40 + 2)

# an error will be raised: unable to concatenate integer with string

# fix 1: use string interpolation
puts "the value of 40 + 2 is #{40 + 2}"

# fix 2: use string concatenation
puts "the value of 40 + 2 is " + (40 + 2).to_s
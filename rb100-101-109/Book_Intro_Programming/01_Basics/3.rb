# ------------------ Solution by Diana

movies = { :movie1 => 1975,
           :movie2 => 2004,
           :movie3 => 2013,
           :movie4 => 2001,
           :movie5 => 1981 }

puts movies[:movie1]
puts movies[:movie2]
puts movies[:movie3]
puts movies[:movie4]
puts movies[:movie5]

# ----------- Solution by Launch School

movies = { :jaws => 1975,
           :anchorman => 2004,
           :man_of_steel => 2013,
           :a_beautiful_mind => 2001,
           :the_evil_dead => 1981 }

puts movies[:jaws]
puts movies[:anchorman]
puts movies[:man_of_steel]
puts movies[:a_beautiful_mind]
puts movies[:the_evil_dead]

# Below is a solution that uses the new syntax for creating hashes (as of Ruby 1.9). This syntax only works when using symbols (e.g., :jaws) as a key. 

movies = { jaws: 1975,
           anchorman: 2004,
           man_of_steel: 2013,
           a_beautiful_mind: 2001,
           the_evil_dead: 1981 }

puts movies[:jaws]
puts movies[:anchorman]
puts movies[:man_of_steel]
puts movies[:a_beautiful_mind]
puts movies[:the_evil_dead]
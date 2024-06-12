advice = "Few things in life are as important as house training your pet dinosaur."

# using `String#slice!`
p advice.slice!("Few things in life are as important as ")
p advice

# using `String#slice`
# calling `slice` on `advice` should return a new string and `advice` remains unchanged
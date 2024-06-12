# -------------- Solution by Diana

contacts = {"Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"}, "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.", :phone=>"123-234-3454"}}

contacts["Joe Smith"][:email] # => "joe@email.com"
contacts["Sally Johnson"][:phone] # => "123-234-3454"

# ---------- Solution by Launch School

puts "Joe's email is: #{contacts["Joe Smith"][:email]}"
puts "Sally's phone number is: #{contacts["Sally Johnson"][:phone]}"
# -------------- Solution by Diana

x = "hi there"
my_hash = {x: "some value"} # => {:x=>"some value"}
my_hash2 = {x => "some value"} # => {"hi there"=>"some value"}

# `my_hash` uses the newer hash syntax in which the key is a symbol and no hash rocket is needed between the symbol key and the value. 

# `my_hash2` uses the older hash syntax in which a key-value pair association is created by the hash rocket that's situated between the key and the value. This older syntax mus t be used if the key is any data type besides a symbol.


# ---------- Solution by Launch School

# The first hash that was created used a symbol `x` as the key. The second hash used the string value of the `x` variable as the key.
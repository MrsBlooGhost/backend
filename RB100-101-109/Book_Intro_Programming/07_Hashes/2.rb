# -------------- Solution by Diana

# `Hash#merge` merges each of its argument hashes into a copy of `self`. It does so non-destructively.

hsh1 = {a: 0, b: 1}
hsh2 = {c: 2, d: 3}

p hsh1 # => {a: 0, b: 1}
p hsh1.merge(hsh2) # => {a: 0, b: 1, c: 2, d: 3}
p hsh1 # => {a: 0, b: 1}

# `Hash#merge!` merges each of its argument hashes into `self` and then returns `self`. This implies that the method is destructive.

hsh3 = {a: 0, b: 1}
hsh4 = {c: 2, d: 3}

p hsh3 # => {a: 0, b: 1}
p hsh3.merge!(hsh4) # => {a: 0, b: 1, c: 2, d: 3}
p hsh3 # => {a: 0, b: 1, c: 2, d: 3}

# ---------- Solution by Launch School

# The difference is `merge!` modifies permanently, while `merge` does not.

cat = {name: "whiskers"}
weight = {weight: "10 lbs"}

puts cat.merge(weight)
puts cat                  # => {:name=>"whiskers"}
puts weight               # => {:weight=>"10 lbs"}

puts cat.merge!(weight)
puts cat                  # => {:name=>"whiskers", :weight=>"10 lbs"}
puts weight               # => {:weight=>"10 lbs"}
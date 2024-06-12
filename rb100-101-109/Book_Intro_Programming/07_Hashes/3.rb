# -------------- Solution by Diana

family = {father: "dad", mother: "mom", sister: "sis", brother: "bro"}

# Using `Hash.each`
family.each { |formal, _| puts formal }
family.each { |_, informal| puts informal }

# Using `Hash#each_key` and `Hash#each_value`
family.each_key { |formal| puts formal }
family.each_value { |informal| puts informal }

# ---------- Solution by Launch School

opposites = {positive: "negative", up: "down", right: "left"}

opposites.each_key { |key| puts key }
opposites.each_value { |value| puts value }
opposites.each { |key, value| puts "The opposite of #{key} is #{value}" }
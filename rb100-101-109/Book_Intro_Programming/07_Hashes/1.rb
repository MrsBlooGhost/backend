# -------------- Solution by Diana

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

# Using `Hash#select`, `Hash#values`, `Array#flatten`
siblings = family.select do |title, name| 
  title == :sisters || title == :brothers
end

siblings.values.flatten # => ["jane", "jill", "beth", "frank", "rob", "david"]

# Using `Hash#select`, `Array#<<`, `Array#flatten`
siblings = []

family.select do |title, name|
  if title == :sisters || title == :brothers
    siblings << name
  end
end

siblings.flatten # => ["jane", "jill", "beth", "frank", "rob", "david"]

# ---------- Solution by Launch School

# Using `Hash#select`, `Hash#values`, `Array#flatten`
immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end

arr = immediate_family.values.flatten # => ["jane", "jill", "beth", "frank", "rob", "david"]
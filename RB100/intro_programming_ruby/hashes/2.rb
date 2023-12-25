# Hash#merge is a non-mutating method that adds the contents of the given
# hash to the receiver.

h1 = {a: 100, b: 200}
h2 = {c: 300, d: 400}

p h1.merge(h2)
p h1

# Hash#merge! is a mutating method that does the same.

h3 = {a: 100, b: 200}
h4 = {c: 300, d: 400}

p h3.merge!(h4)
p h3
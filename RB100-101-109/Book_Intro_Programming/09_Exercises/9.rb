# -------------- Solution by Diana

h = {a:1, b:2, c:3, d:4}

# -- 1
h[:b] # => 2

# -- 2
h[:e] = 5
h # => {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}

# -- 3
h.delete_if { |_, v| v < 3.5 }
h # => {:d=>4, :e=>5}

# ---------- Solution by Launch School

1. h[:b]

2. h[:e] = 5

3.
  # one line version
  h.delete_if { |k, v| v < 3.5 }

  # multi-line version
  h.delete_if do |k, v|
    v < 3.5
  end
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

res = arr.map do |hsh|
  incremented_hash = {}
  hsh.each do |k, v|
    incremented_hash[k] = v + 1
  end
  incremented_hash
end

p res
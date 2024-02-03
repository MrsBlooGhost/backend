arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# solution 1
x = arr.map do |hsh|
  incremented_hash = {}
  hsh.each do |letter, num|
    incremented_hash[letter] = num + 1
  end
  incremented_hash
end

# solution 2
x = arr.each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |k, v|
    incremented_hash[k] = v + 1
  end
  arr << incremented_hash
end

p x
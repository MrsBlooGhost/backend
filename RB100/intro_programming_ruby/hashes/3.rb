h1 = {a: 100, b: 200, c: 300}

keys = h1.each_key do |x|
  puts x
end

values = h1.each_value do |x|
  puts x
end

pairs = h1.each do |k, v|
  puts k
  puts v
end
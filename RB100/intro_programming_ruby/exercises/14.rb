a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

mapped_a = a.map do |word|
  word.split(' ')
end

flattened_mapped_a = mapped_a.flatten

p flattened_mapped_a
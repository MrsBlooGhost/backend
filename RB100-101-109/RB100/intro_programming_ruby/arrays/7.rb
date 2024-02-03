array = ["x", "y", "z"]

array.each_with_index do |element, index|
  puts "#{index}: #{element}"
end
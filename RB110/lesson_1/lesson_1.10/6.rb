ret = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

p ret
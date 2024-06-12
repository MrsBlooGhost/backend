ret = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p ret
# => [1, nil, nil]
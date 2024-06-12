arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

y = arr.sort_by do |subarr|
  subarr.select do |num|
    num.odd?
  end
end

p y
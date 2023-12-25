arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

res = arr.map do |subarr|
  subarr.sort do |a, b|
    b <=> a
  end
end

p res
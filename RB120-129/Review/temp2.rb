# Your `reduce` should take at least 1 argument that represents the array we'll operate on.
# It should also take an optional second argument that represents the default value for the accumulator. 

def reduce(arr, accumulator = arr[0])
  counter = 1
  while counter < arr.size
    accumulator = yield(accumulator, arr[counter])
    counter += 1
  end
  accumulator
end

# reduce(['a', 'b', 'c']) { |acc, value| acc += value }     
# => 'abc'

p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } 
# => [1, 2, 'a', 'b']
=begin
# ----- E
one?([1, 3, 5, 6]) { |value| value.even? } # -> true

one?([1, 3, 5, 7]) { |value| value.odd? } # -> false

one?([2, 4, 6, 8]) { |value| value.even? } # -> false

one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true

one?([1, 3, 5, 7]) { |value| true }  # -> false

one?([1, 3, 5, 7]) { |value| false } # -> false

one?([]) { |value| true } # -> false

# ----- D
Input: an array
Return: a boolean value

# ----- P
Rules
- Input: an array, and a block
- Processes elements in a collection by passing each element value to a block that is provided in the method call
- Return: `true` if the block returns true for exactly one of the element values; `false` otherwise
  - If input array is empty, return `false` regardless of how the block is defined
- Your method may not use any standard ruby method that is named all?, any?, none?, or one?

# ----- A1
Iterate through array, yielding each element to the block. If the block's return value is truthy for only one element value, return true. Otherwise, return false. 
- Initialize a counter to 0.
- Iterate through array.
  - Yield each element to the block.
  - If block's return is truthy, increment counter by 1.
  - Return false if counter is greater than 1.
- Return true if counter is equal to 1. Otherwise, return false.

=end
# ----- C1
def one?(arr)
  counter = 0
  arr.each do |el| 
    counter += 1 if yield(el)
    return false if counter > 1
  end
  counter == 1
end

# ----- C2
# Iterate through the array, yielding each element to the block. Use a local variable `result` as a toggle to keep track of the block's return value. The toggle is set to `false`, by default, and switched to `true` the first time the block returns a truthy value. If the block returns a truthy value a second time, we explicitly return `false`. If, instead, we make it through all iterations, we return the value of `result`.

def one?(arr)
  result = false
  arr.each do |el|
    if yield(el)
      result = !result
      return false if result == false
    end
  end
  result
end

# ----- C3
# We use an `#each` loop to iterate through the array, and a boolean local variable to keep track of whether we've seen a matching element yet. Each element is yielded to the block - If the block returns a falsy value, we move to the next iteration. If the block returns a truthy value, we check to see if we have previously seen a matching element. If we have, we return `false`. Otherwise, we just note that we've seen a matching element and move to the next iteration.
# If we've made it through all iterations, we return the value of the boolean local variable.

def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

p one?([1, 3, 5, 6]) { |value| value.even? } # -> true

p one?([1, 3, 5, 7]) { |value| value.odd? } # -> false

p one?([2, 4, 6, 8]) { |value| value.even? } # -> false

p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true

p one?([1, 3, 5, 7]) { |value| true }  # -> false

p one?([1, 3, 5, 7]) { |value| false } # -> false

p one?([]) { |value| true } # -> false
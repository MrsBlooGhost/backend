=begin
# ----- P
Enumerable#one? processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for exactly one element, then #one? returns true. Otherwise, #one? returns false. Note in particular that #one? will stop searching the collection the second time the block returns true.

Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

Rules
- Input: an array and a block
- Return: true if the block returns true for exactly one element; otherwise, returns false
- Stop processing elements of the input array as soon as the block returns true a second time
- If input array is empty, return false regardless of how the block is defined
- Your method may not use any standard ruby method `all?`, `any?`, `none?`, or `one?`

# ----- E
one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false

# ----- A
- Initialize `result` to false.
- Iterate over input array, accessing each element.
  - Yield to the block, passing in current element as block argument.
    - If return value of block is true:
      - Toggle `result`
      - Return `result` if `result` is equal to false.
- Return `result`.

# ----- C
=end
# ----- Solution 1
def one?(arr)
  result = false
  arr.each do |element| 
    if yield(element) 
      result = !result
      return result if result == false
    end
  end
  result
end

# ----- Solution 2
# We use an `#each` loop to iterate through the array, and a boolean local variable to keep track of whether we've seen a matching element yet. Each element is yielded to the block - If the block returns a falsey value, we move to the next iteration. If the block returns a truthy value, we check to see if we have previously seen a matching element. If we have, we return `false`. Otherwise, we just note that we've seen a matching element and move to the next iteration.
# If we've made it through all iterations, we return the value of the boolean local variable.

def one?(arr)
  seen_one = false
  arr.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end

# ---- Solution 3

def one?(arr)
  count = 0
  arr.each do |element|
    count += 1 if yield(element)
    return false if count > 1
  end
  count == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false
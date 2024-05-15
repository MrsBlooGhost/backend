=begin
# ----- E
all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true

# ----- D
Input: an array
Return: a boolean value

none

# ----- P
Rules
- Input: an array, and a block
- Process elements in a collection by passing each element value to the block provided in the method call
- Return: if the block returns a truthy value for every element, return `true`; otherwise, return `false`
  - If input array is empty, return `true` regardless of how the block is defined
- Stop processing elements of the array as soon as the block returns `false`
- Your method may not use any standard ruby method that is named all?, any?, none?, or one?.

# ----- A1
Iterate through array, yielding each element to the block. If block returns true for each element, return true. Otherwise, return false the first time the block returns false. 
- Iterate through array.
  - Yield each element to the block.
  - If block returns false, return false.
- Return true.

=end
# ----- C1
# This solution is extremely similar to our solution for `any?`.
# We iterate through the collection, and return `false` if we encounter an item that produces a false result when it is yielded to the block. If no such item is encountered, we return `true`.

def all?(arr)
  arr.each { |el| return false unless yield(el) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
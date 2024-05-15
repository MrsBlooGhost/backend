=begin
# ----- E
any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false

# ----- D
Input: array
Return: boolean value

none

# ----- P
Rules
- Input: an array, and a block
- Process elements in a collection by passing each element value to a block provided in the method call
- Return: If the block returns a truthy value for any element, return true; otherwise, return false
  - If original arary is empty, return false regardless of how the block is defined
- Stop processing the collection the first time the block returns true

# ----- A1
Iterate through array, yielding each element to the block. Return true if the block's return value is truthy for any element value passed to it. Otherwise, return false.
- Iterate through array.
  - Yield current element to the block.
  - If block's return value is truthy, explicitly return true.
- Return false.

=end
# ----- C1
# We iterate through the collection, and return `true` the first time we encounter an item that produces a true result when it is yielded to the block. If no such item is encountered, we return `false`.

def any?(arr)
  arr.each { |el| return true if yield(el) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
=begin
# ----- P
The `Enumerable#any?` method processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for any element, then `#any?` returns true. Otherwise, `#any?` returns false. Note that `#any?` will stop searching the collection the first time the block returns `true`.

Write a method `any?` that takes an Array as an argument, and a block. It should return `true` if the block returns `true` for any of the element values. Otherwise, it should return `false`.

Your method should stop processing elements of the Array as soon as the block returns `true`.

If the Array is empty, `any?` should return false, regardless of how the block is defined.

Rules
- Input: an array and a block
- Return: `true` if block returns `true` for any of the element values; `false` otherwise
- Stop processing elements of input array as soon as the block returns `true`
- If input array is empty, return `false` regardless of how the block is defined
- Your method may not use the standard ruby methods `all?`, `any?`, `none?`, or `one?`

# ----- E
any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false

# ----- A
- Iterate over input array, accessing each element.
  - Yield to the block, passing the current element as an argument.
    - If return value of the block is `true`, explicitly return `true`.
- Return `false`.

# ----- C
=end
# ----- Solution 1
def any?(arr)
  arr.each { |element| return true if yield(element) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false
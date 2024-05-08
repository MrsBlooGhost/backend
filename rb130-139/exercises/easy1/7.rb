=begin
# ----- P 
`Enumerable#all?` processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns a truthy value for every element, then `#all?` returns true. Otherwise, `#all?` returns false. Note in particular that `#all?` will stop searching the collection the first time the block returns `false`.

Write a method called `all?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return `true` if the block returns `true` for all of the element values. Otherwise, it should return `false`.

Your method should stop processing elements of the Array as soon as the block returns `false`.

If the Array is empty, `all?` should return true, regardless of how the block is defined.

Your method may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.

Rules
- Input: an array and a block
- Return: `true` if the block returns `true` for all elements; `false` otherwise
- Stop processing elements of input array as soon as block returns `false`
- If input array is empty, return `true` regardless of how the block is defined
- Your method may not use any of the standard ruby methods `all?`, `any?`, `none?`, or `one?`

# ----- E
all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true

# ----- A
- Iterate over input array, accessing each element.
  - Yield to the block, passing in element as an argument.
    - Explicitly return `false` if block returns `false`.
- Return `true`.

=end
# ----- C1
# This solution is extremely similar to our solution for `any?`.
# We iterate through the collection, and return `false` if we encounter an item that produces a false result when it is yielded to the block. If no such item is encountered, we return `true`.

def all?(arr)
  arr.each { |element| return false unless yield(element) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true
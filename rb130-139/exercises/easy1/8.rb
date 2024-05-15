=begin
# ----- E
none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true

# ----- D
Input: array
Return: a boolean value

none

# ----- P
Rules
- Input: array, and a block
- Process elements in a collection by passing each element value to the block that's provided in the method call
- Return: if the block returns true for any element, return `false`; otherwise return `true`
  - If array is empty, return `true` regardless of how the block is defined
- Your method may not use any of the following methods from the Array and Enumerable classes: all?, any?, none?, one?. You may, however, use either of the methods created in the previous two exercises.

# ----- A1
Iterate through array, yielding each element to the block. If the block returns true for any element, return `false`. Otherwise, return `true`.
- Iterate through array.
  - Yield current element to the block.
  - If block returns true, return `false`.
- Return `true`.

=end
# ----- C1
# The key to this solution is that `#none?` is the opposite of `#any?`. `#any?` returns true if the collection contains a match, false if it doesn't. `#none?` returns true if the collection doesn't contain any matches, and false if it does. 
# We'll modify the `#any?` method we wrote earlier. Instead of returning `true` from the `#each` loop, we return `false`. Instead of returning `false` after the loop, we return `true`.

def none?(arr)
  arr.each { |el| return false if yield(el)}
  true
end

# ----- C2
# Since `#none?` is effectively the negation of `#any?`, you'd think that we can just write `!any?(arr)`. However, this fails with a `LocalJumpError` because blocks aren't passed down the calling chain by default. You need to explicitly pass the block to `#any?`; to do that, `#none?` must require a block argument with an `&`. This way, we can pass `&block` to `#any?`, where it's treated as if the call to `#any?` included the block.

def any?(collection)
  collection.each { |item| return true if yield(item) }
  false
end

def none?(arr, &block)
  !any?(arr, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true
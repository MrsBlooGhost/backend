=begin
# ----- P
`Enumerable#none?` processes elements in a collection by passing each element value to a block that is provided in the method call. If the block returns true for any element, then `#none?` returns false. Otherwise, `#none?` returns true. Note in particular that `#none?` will stop searching the collection the first time the block returns true.

Write a method called `none?` that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns false for all of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true.

If the Array is empty, none? should return true, regardless of how the block is defined.

Your method may not use any of the following methods from the Array and Enumerable classes: all?, any?, none?, one?. You may, however, use either of the methods created in the previous two exercises.

Rules
- Input: an array and a block
- Return: `true` if the blocks returns `false` for all elements; `false` otherwise
- If the block returns `true` for any element, then return `false`. Otherwise, return `true`
- Stop processing elements of input array as soon as the block returns true
- If array is empty, return `true` regardless of how the block is defined
- Your method may not use any of the following methods from the Array and Enumerable classes: all?, any?, none?, one?
- You may use either of the methods created in the previous two exercises

# ----- E
none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true

# ----- A
- Check if the block returns `true` for any element in input array. If so, return `false`.
- Otherwise, return `true`.

# ----- C
=end
# ----- Solution 1
def any?(arr)
  arr.each { |element| return true if yield(element) }
  false
end

def none?(arr)
  return false if any?(arr) { |element| yield(element) }
  true
end

# ----- Solution 2
# The key to this solution is that `#none?` is the opposite of `#any?`. `#any?` returns true if the collection contains a match, false if it doesn't. `#none?` returns true if the collection doesn't contain any matches, and false if it does. 
# So, we'll modify the `#any?` method we wrote earlier. Instead of returning `true` from the `#each` loop, we return `false`. Instead of returning `false` after the loop, we return `true`. 

def none?(arr)
  arr.each { |element| return false if yield(element) }
  true
end

# ----- Solution 3
# Since `#none?` is effectively the negation of `#any?`, you'd think that we can just write `!any?(arr)`. However, this fails with a `LocalJumpError` because blocks aren't passed down the calling chain by default. You need to explcitly pass the block to `#any?`; to do that, `#none?` must require a block argument with an `&`. This way, we can pass `&block` to `#any?`, where it's treated as if the call to `#any?` included the block.

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
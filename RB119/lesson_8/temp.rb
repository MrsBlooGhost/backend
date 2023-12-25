=begin
Write a method `group_and_count` that takes an array as a unique parameter,
and returns a hash that contains the unique values of the array as keys and
the counting of each value as values. Empty or `nil` input must return `nil`
instead of a hash.

The following methods are not allowed: `Array#count`, `Array#length`

P-----
- Input: an array of integers
- Return: a hash that contains the unique values of the array as keys and
its count as values
  - Return `nil` if input array is empty or `nil`
- Not allowed to use `Array#count` or `Array#length`

E-----
p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

NOTES-----
Option 1: Iterate and check
- Return `nil` if input is `nil` or is empty array.
- Initialize `result` to empty hash with default value of 0.
- Iterate over input array, accessing each number.
  - Increment value associated with current number key by 1.
- Return `result`.

C-----
=end
# Option 1 Syntax 1
def group_and_count(arr)
  return nil if arr.nil? || arr.empty?
  result = Hash.new(0)
  arr.each { |num| result[num] += 1 }
  result
end

p group_and_count([1,1,2,2,2,3]) #== {1=>2, 2=>3, 3=>1}
p group_and_count([]) == nil
p group_and_count(nil) == nil
p group_and_count([1, 7, 5, -1]) #== {1=>1, 7=>1, 5=>1, -1=>1}
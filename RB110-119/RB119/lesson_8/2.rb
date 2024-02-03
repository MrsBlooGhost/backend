=begin
Write a method that rotates an array by moving the first element to the end of
the array. The original array should not be modified.

Do not use the method `Array#rotate` or `Array#rotate!` for your implementation.

P-----
- Input: an array of integers
- Task: rotate the array by moving the first element to the end of the array
- Return: an array of integers with first element of input array rotated to the
end
- Don't modify the original array
- Can't use `Array#rotate` or `Array#rotate!` methods

E-----
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

NOTES-----
Option 1
- Concatenate elements from (index 1 up to and including index -1) in order to get
array with elements at index 1 up to and including index -1 with array containing
element at index 0.

Option 2
- Initialize empty array.
- Append an array of elements at indices 1 up to and including -1 to array.
- Append an array of element at index 0 to array.
- Flatten resulting array.
- Return result.

Option 3
- Initialize empty array.
- Iterate over input array, accessing each element and its index.
  - Append element to empty array if index is not equal to 0.
- Append element at index 0 of input array to our resulting array.

A-----
Option 1
- Concatenate elements from (index 1 up to and including index -1) in order to get
array with elements at index 1 up to and including index -1 with array containing
element at index 0.

Option 2
- Initialize empty array.
- Append an array of elements at indices 1 up to and including -1 to array.
- Append an array of element at index 0 to array.
- Flatten resulting array.
- Return result.

Option 3
- Initialize empty array.
- Iterate over input array, accessing each element and its index.
  - Append element to empty array if index is not equal to 0.
- Append element at index 0 of input array to our resulting array.

C-----
=end
# Option 1 Syntax 1
def rotate_array(arr)
  arr[1..-1] + [ arr[0] ]
end

# Option 2 Syntax 1
def rotate_array(arr)
  result = []
  result << arr[1..-1] << [ arr[0] ]
  result.flatten
end

# Option 2 Syntax 1
def rotate_array(arr)
  result = []
  arr.each_with_index { |num, idx| result << num if idx != 0 }
  result << arr[0]
  result
end

p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
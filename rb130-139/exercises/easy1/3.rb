=begin
# ----- P
Rules
- Input: a sorted array of integers
- Return: an array that includes all the missing integers, in order, between the first and last elements of original array
  - I assume a new array
  - If there are no missing integers, return an empty array

# ----- E
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
-3 to -2 -- none
-2 to  1 -- -1, 0
 1 to  5 --  2, 3, 4

missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

# ----- D
Input: array
Return: array

array, because input and return are both arrays.

# ----- A1
- Initialize `result` to empty array.
- Iterate over input array, accessing each element and its index.
  - Stop iterating if current index is greater than or equal to (array size - 1).
  - Obtain the difference between the next element and current element. If difference is equal to 1, skip to next iteration.
  - Initialize `x` to 1.
  - Otherwise, iterate (difference - 1) times.
    - Append (current element + x) to a new array.
    - Increment x by 1.
- Return `result`.

=end
# ----- C1
def missing(arr)
  result = []
  arr.each_with_index do |el, idx|
    break if idx >= arr.size - 1
    difference = arr[idx + 1] - el
    next if difference == 1
    x = 1
    (difference-1).times do 
      result << el + x
      x += 1
    end
  end
  result
end

# ----- C2
# This problem boils down to finding the missing integers between each pair of numbers in the original array. 
# `Enumerable#each_cons` is handy when you need to iterate through consecutive, overlapping sequences. (`Enumerable#each_slice`, by contrast, iterates through consecutive, non-overlapping sequences.)
# `Enumerable#each_cons(n)` takes `n` consecutive elements from the input collection, and iterates through each sequence `n` consecutive items.
# The block generates the list of numbers between each pair of numbers, and appends them to the `result` array.

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat( ( (first + 1)..(second - 1) ).to_a )
  end
  result
end

# ----- C3
# We first create an array of all numbers between the minimum and maxinum numbers in the original array. We then subtract the original "incomplete" array from the full "complete" array, erturning an array of elements that were missing in the original array.

def missing(nums)
  full_array = ( (nums.min)..(nums.max) ).to_a
  full_array - nums
end

# Since the original array is already sorted, we gain a small performance advantage by skipping the `Array#min` and `Array#max` calls and simply using `#first` and `#last` to avoid extra computation.

def missing(nums)
  full_array = ( (nums.first)..(nums.last) ).to_a
  full_array - nums
end

# ----- C4
def missing(arr)
  ( (arr.first)..(arr.last) ).each_with_object([]) { |num, result| result << num unless arr.include?(num) }
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
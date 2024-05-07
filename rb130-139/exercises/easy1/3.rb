=begin
----- P
Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

Input: sorted array of integers
Return: array that includes all the missing integers, in order, between first and last elements of input array

----- E
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

----- A
- Iterate over input array.
  - Get first element.
  - Get last element.
  - Place all integers between first and last element in new array IF the integers don't appear in input array.
    - Return this array.

----- C
=end
# ----- Using `Array#each`
def missing(arr)
  result = []
  ( (arr.first)..(arr.last) ).each { |num| result << num unless arr.include?(num) }
  result
end

# ----- Using `Array#each_with_object`
def missing(arr)
  ( (arr.first)..(arr.last) ).each_with_object([]) { |num,result| result << num unless arr.include?(num) }
end

# ----- Using `Enumerable#each_cons
def missing(arr)
  result = []
  arr.each_cons(2) do |num1, num2|
    result.concat( ( (num1 +1)..(num2-1) ).to_a )
  end
  result
end

# ----- Using `Array#min`, `Array#max`, `Array#-`
# Since it's given that the argument array (arr) is sorted, we gain a small performance advantage by skipping the `min` and `max` calls and simply using the `first` and `last` arguments to avoid a bit of extra computation.

def missing(arr)
  ( (arr.min)..(arr.max) ).to_a - arr
end

# ----- Using `Array#first`, `Array#last`, `Array#-`
def missing(arr)
  ( (arr.first)..(arr.last) ).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
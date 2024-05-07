=begin
# ----- P
Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

Input: a positive integer
Return: an array of integers representing the divisors of input integer

Rules:
- Returned array can be in any sequence

# ----- E
divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# ----- A
- Initialize `result` to empty array.
- Iterate from 1 up to input integer.
  - Append current number to `result` if input integer is evenly divisible by current number.
- Return `result` array.

# ----- C
=end
# ----- Using `Range#each`, `Integer#remainder`
def divisors(num)
  result = []
  (1..num).each do |digit|
    result << digit if num.remainder(digit) == 0
  end
  result
end

# ----- Using `Enumerable#each_with_object`, `Integer#remainder`
def divisors(num)
  (1..num).each_with_object([]) do |digit, result|
    result << digit if num.remainder(digit) == 0
  end
end

# ----- Using `Integer#upto`, `Enumerable#select`, `Numeric#%`
def divisors(num)
  1.upto(num).select { |digit| num % digit == 0 }
end

# ----- Using `Integer#sqrt`, `Array#<<`, `Enumerable#sort`, `Array#uniq`
# By only going up to the integer square root (the square root is the 'midway point' for multiplication, whereas dividing by 2 is the midway point for addition), we get all possible values much faster. As the size of `num` increases, the speed at which we get the factors decreases relative to the size of `num`. This means that while it takes more time to run with bigger numbers, it is more efficient.
# - The `Array#uniq` method call at the end is for cases where `num` is 1 or a perfect square.

def divisors(num)
  result = []
  ( 1..Integer.sqrt(num) ).each do |digit|
    result << digit << (num / digit) if num % digit == 0
  end
  result.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
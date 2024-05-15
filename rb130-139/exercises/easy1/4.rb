=begin
# ----- P
Rules
- Input: a positive integer
- Return: an array list of all divisors of the input
  - Can be in any sequence

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

=end
# ----- C1
def divisors(num)
  result = []
  (1..num).each do |digit|
    result << digit if num.remainder(digit) == 0
  end
  result
end

# ----- C2
def divisors(num)
  (1..num).each_with_object([]) do |digit, result|
    result << digit if num.remainder(digit) == 0
  end
end

# ----- C3
# We iterate through all the possible divisors, and create a list of the actual divisors. 
# This is what's called a *brute force algorithm* where we try every possible solution; These are easy to write but don't always produce the fastest results. These aren't necessarily bad solutions, but the speed of brute force algorithms should always be examined. 

def divisors(num)
  1.upto(num).select { |digit| num % digit == 0 }
end

# ----- C4
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
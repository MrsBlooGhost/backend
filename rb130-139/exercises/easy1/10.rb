=begin
# ----- E
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# ----- D
Input: an array
Return: an integer

none

# ----- P
Rules
- Input: an array, and a block
- Return: a count of the number of times the block returns true
- You may not use Array#count or Enumerable#count

# ----- A1
Iterate through array, yielding each element to the block. Increment a counter each time the block returns true.
- Initialize `result` to 0.
- Iterate through array.
  - Yield current element to the block.
  - Increment `result` by 1 if block returns true.
- Return `result`.

# ----- C1
def count(arr)
  result = 0
  arr.each { |el| result += 1 if yield(el) }
  result
end

# ----- A2 Further Exploration
Iterate through array, yielding each element to the block. Start a counter to 0 and increment it for each time the block returns true. Then, return the counter.

=end
# ----- C2 Further Exploration
def count(arr)
  arr.reduce(0) { |result, el| yield(el) ? result + 1 : result }
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
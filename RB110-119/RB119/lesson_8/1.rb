=begin
P-----
- Input: a whole number greater than 0
- Return: a string representing input number in expanded form
- If `0` is in the specific digit place, move on.

E-----
expanded_form(12) == '10 + 2'
expanded_form(42) == '40 + 2'
expanded_form(70304) == '70000 + 300 + 4'
  4 = 4 * 10**0

  300 = 3 * 10**2

  70000 = 7 * 10**4

NOTES-----
Option 1: Iterate and accumulate; Sort; Join
- Integer#divmod(10)

Option 1: Reverse; Iterate and transform; Join

A-----
Option 1 Syntax 1
- Convert input integer to string. Get size of string.
- Initialize `result` to empty array.
- Iterate from 0 up to and excluding (string size), accessing each index.
  - Get divmod of input integer (divmod) 10. Use parallel assignment to re-assign
  `integer` to dividend and `num` to modulus.
  - Raise 10 to power of current index, multiply result by `num`.
  - Prepend resulting value to `result` if resulting value isn't equal to 0.
- Sort `result` so that larger numbers come first.
- Join together elements of `result` with ' + '.

Option 2 Syntax 1
- Convert input integer to string.
- Convert string to array of characters.
- Reverse the order of the characters.
- Iterate over array, accessing each character and its index, and performing
transformation.
  - Convert current character to an integer.
  - Multiply the integer by the result of raising 10 to power of current index.
  - Reject any values that are equal to 0.
- Sort `result` so that larger numbers come first.
- Join together elements of `result` with ' + '.

C-----
=end
# Option 1 Syntax 1
def expanded_form(int)
  str_size = int.to_s.size
  result = []
  (0...str_size).each do |index|
    int, num = int.divmod(10)
    expanded_num = num * 10**index
    result << expanded_num if expanded_num != 0
  end
  result.sort { |a, b| b <=> a }.join(' + ')
end

# Option 2 Syntax 1
def expanded_form(int)
  reversed_ints = int.to_s.chars.reverse
  reversed_ints.map.with_index { |int, index| int.to_i * 10**index }.reject(&:zero?).reverse.join(' + ')
end

# Option
# def expanded_form(int)
#   int.to_s.chars.reverse.map.with_index { |digit, index| p "#{digit} #{index}" }
# end

p expanded_form(12) #== '10 + 2'
p expanded_form(42) #== '40 + 2'
p expanded_form(70304) #== '70000 + 300 + 4'
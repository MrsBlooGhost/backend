# ------- P
# Input: string
# Return: new string with no duplicate consecutive letters

# Explicit Rules:
# 	- May not use `String#squeeze` or `String#squeeze!`

# Implicit Rules:
# 	- Only consider duplicate letters and numbers
# 	- If input is empty string, return empty string
# 	- Can we mutate the input string?

# # ------- E
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# # ------- D
# - Array?

# # ------- A
# - Initialize a new string
# - Iterate through input string, accessing each character
# 	- Append current character to new string if it doesn't match the previous character in new string
# - Return new string

# # ------- C
def crunch(str)
  result = ''
  str.each_char { |char| result << char if char != result[-1] }
	result
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
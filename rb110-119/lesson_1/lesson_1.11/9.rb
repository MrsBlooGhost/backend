# Problem Description: As we have seen previously, we can use some built-in string
# methods to change the case of a string. A notably missing method is something
# provided in Rails, but not in Ruby itself...`titleize`. This method in Ruby on
# Rails creates a string that has each word capitalized as it would be in a title.
# Write your own version of the rails titleize implementation.



# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method that capitalizes the first letter of each word in a string.

# Input: a string
# Output: a new string

# Rules
# Explicit:
# - The first letter of each word should be capitalized.

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# words = "the flintstones rock"
# words = "The Flintstones Rock"


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# In a method `titleized` that takes one parameter `string`,
# 1. Create a local variable `words_array` that contains each word in the string
# as an element.
# 2. Iterate over `words_array`, capitalizing the first letter of each word.
# 3. Push the first word in input string to `words_array` array.
# 4. Repeat steps 2-3 until input string is empty.
# 5. Convert `words_array` array to string.
# 6. Return string.


# ---------------- Code (translate algorithm to programming language) ----------------
words = "the flintstones rock"

def titleized(string)
  words_array = string.split
  words_array.map! do |word|
    word.capitalize
  end
  string = words_array.join(" ")
end


p titleized(words)
p words


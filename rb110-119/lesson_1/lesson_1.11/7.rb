# Problem Description:
# Create a hash that expresses the frequency with which each letter occurs in this
# string:

# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string, create a hash that expresses the frequency with which each
# letter in the string occurs.

# Input: string
# Output: hash

# Rules
# Explicit:
# - Keys of the hash contain unique letters of the input string
# - Values of the hash are integers that represent the frequency that each key
# occurs in the string

# Implicit:
# - Case matters

# ---------------- Examples (confirm/refute assumptions ----------------
# statement = "The Flintstones Rock"
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.

# input: string
# intermediary: array?
# output: hash


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Count the frequency of a unique letter (case matters).
#   - Convert input string to array.
#   - Extract unique letters to a new array.
#   - Count the frequency of each letter in the new array.
# 2. Add the letter as a key to the hash.
# 3. Add the frequency as a value to the hash.


# ---------------- Code (translate algorithm to programming language) ----------------
statement = "The Flintstones Rock"
array = []
count = 0
hash = {}

loop do
  break if count == statement.length
  array << statement[count]
  count += 1
end

uniq_letters = array.uniq
uniq_letters.delete_if {|letter| letter == " "}

counter = 0

loop do
  break if counter == uniq_letters.size
  hash[uniq_letters[counter]] = array.count(uniq_letters[counter])
  counter += 1
end

p hash
=begin
# ----- P
Rules
- Input: an optional block
- Return: the block's return value
  - If the block is specified, the method should execute it
  - If no block is specified, the method should return the string `"Does not compute."`

# ----- E
compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

# ----- D

# ----- A1
- If block is given, yield to the block and return block's return value.
- If not, return "Does not compute."

=end
# ----- C1
def compute
  block_given? ? yield : "Does not compute."
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# ----- C2
# The `Kernel#block_given?` method can be used to determine if a block has been passed to a method, even if there's no mention of a block in the method arguments.
# We use `Kernel#block_given?` to detect when we should return the string and when we should return the value yielded by the block. 

def compute
  return 'Does not compute.' unless block_given?
  yield
end

# ----- Further Exploration
def compute(arg)
  return 'No block was given!' unless block_given?
  yield(arg)
end

p compute(10) { |arg| arg } == 10
p compute(10) { |arg| arg + 15 } == 25
p compute('he') { |arg| arg + 'llo' } == 'hello'
p compute('what') == 'No block was given!'
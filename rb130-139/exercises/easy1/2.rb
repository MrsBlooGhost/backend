# ----- Using `if` conditional

def compute
  if block_given?
    yield
  else
    'Does not compute.'
  end
end

# ----- Using ternary operator

def compute
  block_given? ? yield : 'Does not compute.'
end

# ----- Using explicit `return`

def compute
  return 'Does not compute.' unless block_given?
  yield
end

# ----- Test Cases

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# ----- Further Exploration

def compute(arg)
  return 'No block was given!' unless block_given?
  yield(arg)
end

p compute(10) { |arg| arg } == 10
p compute(10) { |arg| arg + 15 } == 25
p compute('he') { |arg| arg + 'llo' } == 'hello'
p compute('what') == 'No block was given!'
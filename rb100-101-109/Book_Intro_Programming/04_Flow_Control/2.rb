# -------------- Solution by Diana

def all_caps(str)
  str.upcase if str.size > 10
end

puts all_caps("hello")
puts all_caps("hello world")

# ---------- Solution by Launch School

# caps_method.rb

def caps(string)
  if string.length > 10
    string.upcase
  else
    string
  end
end

puts caps("Joe Smith")
puts caps("Joe Robertson")
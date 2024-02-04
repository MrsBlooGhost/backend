def caps(str)
  str.upcase if str.length > 10
end

p caps("hi")
p caps("hihellohihellohi")
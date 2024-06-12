indent = 0
phrase = "The Flintstones Rock!"

loop do
  puts phrase.rjust(phrase.length+indent)
  indent += 1
  break if indent == 10
end
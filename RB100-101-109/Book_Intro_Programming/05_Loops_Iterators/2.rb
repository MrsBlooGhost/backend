# -------------- Solution by Diana

answer = nil
while answer != "STOP"
  puts "Would you like to take the survey?"
  answer = gets.chomp.upcase
end

# ---------- Solution by Launch School

x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end
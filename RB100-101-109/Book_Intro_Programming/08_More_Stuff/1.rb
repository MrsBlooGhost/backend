# ------------ Solution by Diana

def check_match(str)
  if str =~ /lab/
    puts str
  end
end

check_match("laboratory")
check_match("experiment")
check_match("Pans Labyrinth")
check_match("elaborate")
check_match("polar bear")

# ------- Solution by Launch School

def check_in(word)
  if /lab/ =~ word
    puts word
  else
    puts "No match"
  end
end

check_in("laboratory")
check_in("experiment")
check_in("Pans Labyrinth")
check_in("elaborate")
check_in("polar bear")
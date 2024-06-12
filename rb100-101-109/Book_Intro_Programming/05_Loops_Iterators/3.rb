# -------------- Solution by Diana

def count_to_zero(num)
  if num <= 0
    puts num
  else
    puts num
    count_to_zero(num-1)
  end
end

count_to_zero(10)

# ---------- Solution by Launch School

def count_to_zero(number)
  if number <= 0
    puts number
  else
    puts number
    count_to_zero(number-1)
  end
end

count_to_zero(10)
count_to_zero(20)
count_to_zero(-3)
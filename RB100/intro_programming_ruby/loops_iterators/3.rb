def countdown(num)
  return if num < 0
  puts num
  num -= 1
  countdown(num)
end

countdown(10)
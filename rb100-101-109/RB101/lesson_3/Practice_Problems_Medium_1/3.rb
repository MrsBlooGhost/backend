def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# `number % divisor == 0` ensures that the dividend is a factor of `number`

# line 8 ensures that the return value of the method is the array of factors
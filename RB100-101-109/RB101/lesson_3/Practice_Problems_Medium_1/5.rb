limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# `limit` is not visible inside the scope of `fib`. `fib` is a method and doesn't have
# access to local variables outside of its scope. We can define `fib` is take a parameter
# `limit` and pass `limit` from line 1 in when we invoke `fib`.
# -------------- Solution by Diana

The error tells us that there is a syntax error on line 8: Ruby was expecting the keyword `end`, but it was not provided so there was an unexpected abrupt end to our code. Currently, the `end` in our code gets matched as part of the `if` statement. The error is raised because there is no `end` associated with the method definition. 

We can fix the error by adding another `end` after the `end` already in our code.

def equal_to_four(x)
  if x == 4
    puts "yup"
	else
    puts "nope"
  end
end

equal_to_four(5)

# ---------- Solution by Launch School

The `end` in the code above gets matched with the `if..else` statement. The error message tells us that the interpreter was expecting the keyword `end` to close off our `equal_to_four` method, and that `end` was not found.
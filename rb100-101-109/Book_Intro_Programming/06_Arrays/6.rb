# -------------- Solution by Diana

There is a TypeError in which Ruby complains that it is unable to convert the string `margaret` into an integer. 

We are attempting to change the string `margaret` at index 3 of the `names` array to `jody`. To do so, we must use array element assignment like so:

names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'
names # => ["bob", "joe", "susan", "jody"]

# ---------- Solution by Launch School

You are attempting to set the value of an item in an array using a string as the key. Arrays are indexed with integers, not strings. You would modify the array by doing the following:

names[3] = 'jody'   # => ["bob", "joe", "susan", "jody"]
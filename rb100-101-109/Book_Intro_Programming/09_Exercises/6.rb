# -------------- Solution by Diana

arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 3]

# -- Destructively get rid of duplicates
arr.uniq # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 3]

# -- Nondestructively get rid of duplicates
arr.uniq! # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# ---------- Solution by Launch School

# Does not modify calling object
arr.uniq

# Modifies the calling object
arr.uniq!
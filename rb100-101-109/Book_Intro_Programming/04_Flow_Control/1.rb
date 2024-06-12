# -------------- Solution by Diana

(32 * 4) >= 129 # => false

false != !true # => false

true == 4 # => false

false == (847 == '847') # => true

(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
(!true || (!(20) == 20) || ((82) == 82)) || false
(!true || (!20 == 20) || (82 == 82)) || false
(!true || false || true) || false
(false || false || true) || false
(true) || false
true || false
# => true

# ---------- Solution by Launch School

1. `false`
2. `false`
3. `false`
4. `true`
5. `true`
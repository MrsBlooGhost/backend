def joinor(arr, delim1 = ", ", delim2 = " or ")
  if arr.count < 2
    arr.to_s
  elsif arr.count == 2
    arr.join(delim2)
  elsif arr.count >= 3
    arr[0..-1].join(delim1).insert(-2, delim2})
  end
end

p joinor([1, 2])                   # => "1 or 2"
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"
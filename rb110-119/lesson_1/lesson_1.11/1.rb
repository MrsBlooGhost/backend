flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

ret = flintstones.each_with_object({}) do |value, hash|
  hash[value] = flintstones.index(value)
end

p ret
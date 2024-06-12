hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |key, arr|
  arr.each do |word|
    word.chars.each do |letter|
      p letter if vowels.include?(letter)
    end
  end
end
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, arr|
  arr.each do |word|
    word.chars.each do |letter|
      if /[aeiou]/.match(letter)
        puts letter
      end
    end
  end
end
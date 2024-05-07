=begin
# ----- P
The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called [Rot13](https://en.wikipedia.org/wiki/ROT13).

Write a program that deciphers and prints each of these names.

Input: a string of names in encrypted form using ROT13
Output: a string of deciphered names

Rules
- ROT13 is a substitution cipher that replaces a letter with the 13th letter after it in the alphabet.
- Case-sensitive
- Keep spaces and dashes in place

# ----- E
Nqn Ybirynpr
  N - ciphered idx 13 - deciphered idx  0 - A
    13 - 13 = 0
  q - ciphered idx 16 - deciphered idx 13 - d
    16 - 13 = 0
  n - ciphered idx 13 - deciphered idx  0 - a
  [space]
  Y - ciphered idx 24 - deciphered idx 11 - L
    24 - 13 = 11
  b - ciphered idx  1 - Deciphered idx 14 - o
    1 - 13 = -12
    26 - 12 = 14
  i - ciphered idx  8 - Deciphered idx 21 - v
  8 - 13 = -5
  26 - 5 = 21

Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu

# ----- A
- Create constant of alphabetical letters.
- Split input string into array of characters.
- Iterate over array of characters, performing transformation.
  - If current character is a whitespace, return a whitespace.
  - If current character is a dash, return a dash.
  - Otherwise, find index of downcased version of current character in `ALPHABET`.
    - Initialize `deciphered_idx` to (current index - 13).
      - If `deciphered_idx` is greater than or equal to 0:
        - Initialize `deciphered_char` to character at `deciphered_idx`.
        - If current character is downcased, return downcased version of `deciphered_char`. Otherwise, return its upcased version.
      - If `deciphered_idx` is negative:
        - Initialize `deciphered_char` to character at index (26 + `deciphered_idx`)
        - If current character is downcased, return downcased version of `deciphered_char`. Otherwise, return its upcased version.
  - Join together new array into string.
    - Return string.
  
# ----- C
=end
# ----- Solution 1
ALPHABET = ('a'..'z').to_a

def decipher(name)
  name.split('').map do |char|
    if char == ' '
      ' '
    elsif char == '-'
      '-'
    else
      deciphered_idx = nil
      ALPHABET.each_with_index do |letter, idx| 
        deciphered_idx = (idx - 13) if letter == char.downcase
      end

      deciphered_char = (deciphered_idx >= 0 ? ALPHABET[deciphered_idx] : ALPHABET[26 + deciphered_idx])

      char.downcase == char ? deciphered_char : deciphered_char.upcase
    end
  end.join
end

p decipher("Tenpr Ubccre")
p decipher("Nqryr Tbyqfgvar")
p decipher("Nyna Ghevat")
p decipher("Puneyrf Onoontr")
p decipher("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p decipher("Wbua Ngnanfbss")
p decipher("Ybvf Unvog")
p decipher("Pynhqr Funaaba")
p decipher("Fgrir Wbof")
p decipher("Ovyy Tngrf")
p decipher("Gvz Orearef-Yrr")
p decipher("Fgrir Jbmavnx")
p decipher("Xbaenq Mhfr")
p decipher("Fve Nagbal Ubner")
p decipher("Zneiva Zvafxl")
p decipher("Lhxvuveb Zngfhzbgb")
p decipher("Unllvz Fybavzfxv")
p decipher("Tregehqr Oynapu")

# ----- Solution 2: Using helper methods
# We used the description of Rot13 directly ("rotate" each character by 13).
# Most computers today use a character encoding called ASCII to store the basic set of characters such as Latin letters, Arabic digits, and some punctuation. Lowercase letters all have consecutive values between 97 and 122, while uppercase letters have consecutive values between 65 and 90. This makes implementation of Rot13 easy.

# We set up a constant array that contains our encrypted list of pioneers.

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'].freeze

# We use a method `rot13` to decrypt each name in the list, one at a time, and within that method, we use `decipher_character` to decrypt each character. We use `String#each_char` and `Enumerable#reduce` to iterate through the characters in `encrypted_text`, and construct the decrypted return value.

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

# `decipher_character` uses a `case` statement that breaks the character decryption problem into 3 parts:  # 1) The letters between A and M. We shift the character 13 places forward ('A' becomes 'N', 'B' becomes 'O', etc.) with `String#ord`, which converts a character to numeric value, and `Integer#chr`, which converts a numeric value to a character.
# 2) The letters between N and Z. We do something similar, but this time, we shift the letters to the left by 13 places ('N' becomes 'A', 'O' becomes 'B', etc.)
# 3) Everything else. We simply return the unchanged value.
# Note that for groups 1 and 2, we check for both uppercase and lowercase letters.

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else                          encrypted_char
  end
end

# Once all components are in place, we iterate through the list of encrypted names, and print each decrypted name.

ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
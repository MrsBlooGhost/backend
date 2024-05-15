=begin
# ----- P
Rules
- Input: a list of the string names
- Output: The deciphered string name
- The names are encrypted using Rot13, in which a letter is replaced by the 13th letter after it in the alphabet.
- Case-sensitive
- Keep spaces and dashes in place

# ----- E
Nqn Ybirynpr
N -- 78 --- 78 - 13 = 65 --- 65.chr = "A"
q -- 113 --- 113 - 13 = 100 --- 100.chr = "d"

# ----- D
Input: Array
Output: String

# ----- NOTES
`Str#ord`
`Integer#chr`

# ----- A1
- Iterate through the list of encrypted names, and print each decrypted name.
  - Decrypt each name in the list.
    - Decrypt each character in the name. 

Method `rot13`: Decrypt each name in the list.
- Argument: encrypted name
- Iterate over an array of the characters in the name, and pass current character to helper method `decipher_char`. Start with an empty string, and reduce return values of `decipher_char` to the string.

Helper `decipher_char`: Decrypt each character in the name. 
- Argument: encrypted char
- If char is a-m or A-M, find its numeric ASCII equivalent, add 13 to it, and convert the numeric value back to a character equivalent.
- If char is n-z or N-Z, find its numeric ASCII equivalent, subtract 13 from it, and convert the numeric value back to a character equivalent.
- Else, return current char.

=end
# ----- C1
# We use the description of Rot13 directly ("rotate" each character by 13).
# Most computers use a character encoding called ASCII to store the basic set of characters such as Latin letters, Arabic digits, and some punctuation. 

# We begin by setting up a constant array `ENCRYPTED_PIONEERS` that contains our encrypted list of pioneers. We ultimately want to iterate through this list, and print each decrypted name. 
# We use a method `rot13` to decrypt each name in the list. Within this method, we use a helper method `decipher_character` to decrypt each character. We use `String#each_char` and Enumerable#reduce` to iterate through the characters in `encrypted_text` and construct the decrypted return value.
# `decipher_character` uses a `case` statement that breaks the character decryption problem into 3 parts:  
  # 1) The letters between A and M (upper- and lowercase). We shift the character 13 places forward ('A' becomes 'N', 'B' becomes 'O', etc.) with `String#ord`, which converts a character to numeric value, and `Integer#chr`, which converts a numeric value to a character.
  # 2) The letters between N and Z (upper- and lowercase). We do something similar, but this time, we shift the letters to the left by 13 places ('N' becomes 'A', 'O' becomes 'B', etc.)
  # 3) Everything else. We simply return the unchanged value.

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
  'Tregehqr Oynapu',
  ]
  
def decrypt_char(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then
  (encrypted_char.ord - 13).chr
  else
  encrypted_char
  end
end
  
def rot13(encrypted_name)
  encrypted_name.each_char.reduce('') do |result, encrypted_char|
    result + decrypt_char(encrypted_char)
  end
end
  
ENCRYPTED_PIONEERS.each do |encrypted_name|
  puts rot13(encrypted_name)
end
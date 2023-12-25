=begin

Write a program that reads the content of a text file and then prints the longest
sentence in the file based on number of words. Sentences may end with periods
(`.`), exclamation points (`!`), or question marks (`?`). Any sequence of
characters that are not spaces or sentence-ending characters should be treated
as a word. You should also print the number of words in the longest sentence.

E-----
Example text:
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.

The longest sentence in the above text is the last sentence; it is 86 words long.
(Note that each `--` counts as a word.)


Download the book at http://www.gutenberg.org/cache/epub/84/pg84.txt, and run
your program on this file.

The longest sentence in this book is 157 words long.

P-----
- Input: strings representing a text file
- Output: a string representing the longest sentence in the file based on the
number of words; the number of words in the longest sentence
- Sentences end with periods (`.`), exclamation points (`!`), or question marks
(`?`).
- Words are any sequences of characters that aren't spaces or sentence-ending characters.

NOTES-----
Option 1:
- Split string to get array of sentences.
- Iterate over array to access each sentence.
  - Count number of words in current sentence.
  - Conditional check to determine if the count is greater than our counter.
  - If so, re-assign our counter to current count and our string variable to
  current sentence.
- Output both counter and sentence.

A-----
- Initialize `longest_sentence` to empty string.
- Initialize `max_count` to 0.
- Split the string on a period, exclamation point, or question mark. Initalize
result to `sentences`.
- Iterate over `sentences`, accessing each subarray (name `sentence`).
  - Initialize to `word_count` to the result of spliting each `sentence` subarray
  on a whitespace and counting the number of elements in the resulting array.
  - If `word_count` is greater than `max_count`, re-assign `max_count` to `word_count`
  and `longest_sentence` to current subarray joined together on a whitespace.
- Output a sentence stating which sentence is the longest and the count of it.

C-----
=end
# My Solution
def longest_sentence(text)
  longest_sentence = ''
  max_count = 0

  sentences = text.split(/[?.!]/)
  sentences.each do |sentence|
    word_count = sentence.split(' ').count
    if word_count > max_count
      max_count = word_count
      longest_sentence = sentence
    end
  end

  p "#{longest_sentence}"
  p "Contains #{max_count} words"
end

# LS Solution
def longest_sentence(text)
  sentences = text.split(/[?.!]/)
  longest_sentence = sentences.max_by { |sentence| sentence.split(' ').size }
  longest_sentence = longest_sentence.strip
  max_count = longest_sentence.split.size

  p "#{longest_sentence}"
  p "Contains #{max_count} words"
end

longest_sentence("Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.")
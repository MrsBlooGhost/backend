# -------------- Solution by Diana

arr = ["eat", "sleep", "repeat"]

arr.each_with_index { |word, index| puts "#{index}, #{word}" }

# ---------- Solution by Launch School

**Note: The problem description and solution aren't completely in agreement. The description asks us to print the index of each element, but the solution prints the index plus 1. We've left this disagreement as-is for consistency with the video. Feel free to choose which approach you want to use.**

top_five_games = ["mario brothers",
                  "excite bike",
                  "ring king",
                  "castlevania",
                  "double dragon"]

top_five_games.each_with_index do | game, index |
  puts "#{index + 1}. #{game}"
end
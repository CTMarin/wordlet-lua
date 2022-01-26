require("parse-words")

local wordlet_word_file = read_file("word-list.txt")
local worldlet_word_table = string_to_table(wordlet_word_file)

print(pick_rnd_word(worldlet_word_table))
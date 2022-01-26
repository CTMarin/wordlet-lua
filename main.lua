require("parse-words")
require "terminal"

local worldlet_word_table = read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

print(pick_rnd_word(worldlet_word_table))
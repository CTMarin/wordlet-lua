<<<<<<< HEAD
require("parse-words")
=======
require "terminal"
>>>>>>> db53e39ed228a1a477629378678ef71d950eeef6

local wordlet_word_file = read_file("word-list.txt")
if wordlet_word_file == nil then os.exit(-1) end

local worldlet_word_table = string_to_table(wordlet_word_file)
print(pick_rnd_word(worldlet_word_table))
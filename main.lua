require "parse-words"
require "terminal"
require "word"

local worldlet_word_table = Read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

<<<<<<< HEAD
local random_word = Pick_random_word(worldlet_word_table)
main_menu()
=======
local random_word = Pick_random_word(worldlet_word_table)
>>>>>>> 4eabbbd8a78f635a6aa79f6f8ff7d22d79f00fc3

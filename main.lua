require("parse-words")
require "terminal"
require 'word'

local worldlet_word_table = Read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

local random_word = Pick_random_word(worldlet_word_table)
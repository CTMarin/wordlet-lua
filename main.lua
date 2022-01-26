require "parse-words"
require "terminal"
require "word"

local tries = 5

local worldlet_word_table = Read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

local random_word = Pick_random_word(worldlet_word_table)
local option = main_menu()

if option == menu_options["Play"] then
    play_game()
else
    os.exit()
end

function play_game()
    while tries >= 0 do
        local input = read_terminal(worldlet_word_table)
        print("Tries left: " .. tries .. " ")
        match
        write_terminal(input)
        tries = tries-1
    end
end


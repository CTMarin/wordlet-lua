require "parse-words"
require "terminal"
require "word"

local tries = 5

local worldlet_word_table = Read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

local random_word = Pick_random_word(worldlet_word_table)
local option = main_menu()

function play_game()
    print("Debug-Hint: " .. random_word)
    while tries >= 0 do
        local input = read_terminal(worldlet_word_table)
        print("Tries left: " .. tries .. " ")
        local matches = Matching_characters(input, random_word)
        write_terminal(input, matches)
        tries = tries-1
    end

    print("The correct word was: " .. random_word)
end

if option == menu_options["Play"] then
    play_game()
else
    os.exit()
end




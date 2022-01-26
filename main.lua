require "parse-words"
require "terminal"
require "word"

local tries = 5

local worldlet_word_table = Read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

local random_word = Pick_random_word(worldlet_word_table)

function play_game()
    while true do
        local option = main_menu()
        if option == menu_options["Play"] then
            local guessed = false
            while tries >= 0 and not guessed do
                local input = read_terminal(worldlet_word_table)
                print(Escape["bold"] .. "Tries left: " .. tries .. " ")
                local matches = Matching_characters(input, random_word)
                guessed = write_terminal(input, matches)
                tries = tries-1
            end

            if tries == 0 then
                print(Escape["red"] .. "YOU LOST..." .. Escape["none"] .. "The correct word was: " .. Escape["yellow"] .. Escape["bold"] .. random_word)
            else
                print(Escape["green"] .. "Congrats! YOU WON!!")
            end
        else
            os.exit()
        end
        
    end
     
end

play_game()


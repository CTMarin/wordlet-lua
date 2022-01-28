function Read_file(path)
    local result = {}
    for line in io.lines(path) do
        result[#result + 1] = line
    end
    return result
end

function Pick_random_word(word_table)
    local table_size = #word_table
    math.randomseed(os.clock())
    local selected_word_index = math.random(0, table_size)
    return word_table[selected_word_index]
end

function On_list(word, list)
    for k, str in pairs(list) do
        if str == word then
            return true
        end
    end
    return false
end


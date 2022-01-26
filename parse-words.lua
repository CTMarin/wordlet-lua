function read_file(path)
    local result = {}
    for line in io.lines(path)
    do 
        result[#result+1] = line
    end
    return result
end

function pick_rnd_word(word_table)
    local table_size = #word_table
    math.randomseed()
    local selected_word_index = math.random(0, table_size)
    return word_table[selected_word_index]
end

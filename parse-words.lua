function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

function string_to_table(input)
    local list = {}
    for str in string.gmatch(input, "([^"..'\n'.."]+)") do
        table.insert(list, str)
    end
    return list
end

function pick_rnd_word(word_table)
    local table_size = #word_table
    math.randomseed()
    local selected_word_index = math.random(0, table_size)
    return word_table[selected_word_index]
end
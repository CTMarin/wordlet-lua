require "terminal"

local function read_file(path)
    local result = {}
    for line in io.lines(path)
    do 
        result[#result+1] = line
    end
    return result
end

local function string_to_table(input)
    local list = {}
    for str in string.gmatch(input, "([^"..'\n'.."]+)") do
        table.insert(list, str)
    end
    return list
end

local function pick_rnd_word(word_table)
    local table_size = #word_table
    math.randomseed()
    local selected_word_index = math.random(0, table_size)
    return word_table[selected_word_index]
end

local worldlet_word_table = read_file("word-list.txt")
if worldlet_word_table == nil then os.exit(-1) end

print(pick_rnd_word(worldlet_word_table))
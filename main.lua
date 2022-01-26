local function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
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

local wordlet_word_file = read_file("word-list.txt")
if wordlet_word_file == nil then os.exit(-1) end

local worldlet_word_table = string_to_table(wordlet_word_file)
print(pick_rnd_word(worldlet_word_table))
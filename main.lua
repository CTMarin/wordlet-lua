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
        print(str)
    end
end

local function pick_rnd_word()
    local fileContent = read_file("word-list.txt")
    local word_table = string_to_table(fileContent)
end

local fileContent = read_file("word-list.txt")

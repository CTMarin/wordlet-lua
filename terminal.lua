require "parse-words"

local escape = {
    ["red"] = "\027[31m",
    ["green"] = "\027[32m",
    ["yellow"] = "\027[33m",
    ["strikethrough"] = "\027[9m",
    ["bold"] = "\027[1m",
}

function read_terminal(list)
    io.write("Input a valid word of length 5:\n")
    io.flush()
    input = io.read()
    while (string.len(input) ~= 5) or (not On_list(input, list)) do
        io.write("Input a valid word of length 5:\n")
        io.flush()
        input = io.read()
    end
    
    return input
end

function write_terminal(msg)
    print(escape["orange"] .. escape["bold"] .. msg)
end

--write_terminal("Hola")
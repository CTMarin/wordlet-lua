local escape = {
    ["red"] = "\027[31m",
    ["green"] = "\027[32m",
    ["orange"] = "\027[33m",
    ["strikethrough"] = "\027[9m",
    ["bold"] = "\027[1m",
}

function read_terminal(list)
    io.write("Input a word of length 5:\n")
    io.flush()
    input = io.read()
    while string.len(input) ~= 5 do
        io.write("Input a word of length 5:\n")
        io.flush()
        input = io.read()
    end
    
    return input
end

function write_terminal(msg)

    print(escape["green"] .. msg)
end

function main_menu()
    local banner = escape["red"]..[[
██╗    ██╗ ██████╗ ██████╗ ██████╗ ██╗     ███████╗████████╗    ██╗     ██╗   ██╗ █████╗ 
██║    ██║██╔═══██╗██╔══██╗██╔══██╗██║     ██╔════╝╚══██╔══╝    ██║     ██║   ██║██╔══██╗
██║ █╗ ██║██║   ██║██████╔╝██║  ██║██║     █████╗     ██║       ██║     ██║   ██║███████║
██║███╗██║██║   ██║██╔══██╗██║  ██║██║     ██╔══╝     ██║       ██║     ██║   ██║██╔══██║
╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝███████╗███████╗   ██║       ███████╗╚██████╔╝██║  ██║
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝   ╚═╝       ╚══════╝ ╚═════╝ ╚═╝  ╚═╝                                                                              
    ]]
    print(banner)
end

write_terminal("Hola")
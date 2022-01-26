require "parse-words"

local escape = {
    ["none"] = "\27[0m",
    ["red"] = "\027[31m",
    ["green"] = "\027[32m",
    ["yellow"] = "\027[33m",
    ["strikethrough"] = "\027[9m",
    ["bold"] = "\027[1m",
}

local menu_options = {
    ["Play"] = "1",
    ["Exit"] = "2"
}

function read_terminal(list)
    io.write("Input a valid word of length 5:\n")
    io.flush()
    local input = io.read()
    while (string.len(input) ~= 5) or (not On_list(input, list)) do
        io.write("Input a valid word of length 5:\n")
        io.flush()
        input = io.read()
    end
    return input
end

function write_terminal(msg)
    
    for i=1,#msg do
        io.write(msg:sub(i,i) .. " ")
    end
    print("")
    
end

function main_menu()
    print_banner()
    io.flush()
end

function print_banner()
    local banner = escape["red"]..[[
██╗    ██╗ ██████╗ ██████╗ ██████╗ ██╗     ███████╗████████╗    ██╗     ██╗   ██╗ █████╗ 
██║    ██║██╔═══██╗██╔══██╗██╔══██╗██║     ██╔════╝╚══██╔══╝    ██║     ██║   ██║██╔══██╗
██║ █╗ ██║██║   ██║██████╔╝██║  ██║██║     █████╗     ██║       ██║     ██║   ██║███████║
██║███╗██║██║   ██║██╔══██╗██║  ██║██║     ██╔══╝     ██║       ██║     ██║   ██║██╔══██║
╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝███████╗███████╗   ██║       ███████╗╚██████╔╝██║  ██║
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝   ╚═╝       ╚══════╝ ╚═════╝ ╚═╝  ╚═╝                                                                              
    ]]
    print(escape["yellow"] .. escape["bold"] .. "Bienvenido a..." .. escape["none"])
    print(banner)
end


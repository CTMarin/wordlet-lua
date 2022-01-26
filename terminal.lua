require "parse-words"
require "word"

Escape = {
    ["none"] = "\27[0m",
    ["red"] = "\027[31m",
    ["green"] = "\027[32m",
    ["yellow"] = "\027[33m",
    ["strikethrough"] = "\027[9m",
    ["bold"] = "\027[1m",
}

menu_options = {
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

function write_terminal(msg, matches)
    local guessed = 0
    for i=1,#msg do
        local esc = Escape["red"]
        if matches[i].well_placed then
            esc = Escape["green"]
            guessed = guessed + 1
        elseif matches[i].included then
            esc = Escape["yellow"]
        end

        io.write(esc .. msg:sub(i,i) .. " ")
        io.write(Escape["none"])
    end
    print("")
    return guessed == #msg
end

function main_menu()
    print_banner()
    io.flush()
    return read_option()
end

function read_option()
    for k, v in pairs(menu_options) do
        print(Escape["red"]..v..". "..Escape["none"]..k)
    end
    io.write("Select an option: ")
    io.flush()
    return io.read()
end

function print_banner()
    local banner = Escape["red"]..[[
██╗    ██╗ ██████╗ ██████╗ ██████╗ ██╗     ███████╗████████╗    ██╗     ██╗   ██╗ █████╗ 
██║    ██║██╔═══██╗██╔══██╗██╔══██╗██║     ██╔════╝╚══██╔══╝    ██║     ██║   ██║██╔══██╗
██║ █╗ ██║██║   ██║██████╔╝██║  ██║██║     █████╗     ██║       ██║     ██║   ██║███████║
██║███╗██║██║   ██║██╔══██╗██║  ██║██║     ██╔══╝     ██║       ██║     ██║   ██║██╔══██║
╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝███████╗███████╗   ██║       ███████╗╚██████╔╝██║  ██║
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝   ╚═╝       ╚══════╝ ╚═════╝ ╚═╝  ╚═╝                                                                              
    ]]
    print(Escape["yellow"] .. Escape["bold"] .. "Bienvenido a..." .. Escape["none"])
    print(banner)
end


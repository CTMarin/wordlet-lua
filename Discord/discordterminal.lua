require "parse-words"
require "word"
require "discord"

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

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function read_terminal(list, chosenwords, i, channel)
    channel:send("Input a valid word of length 5:\n")
    local input = io.read()
    while (string.len(input) ~= 5) or (not On_list(input, list) or (has_value(chosenwords, input))) do
        if(has_value(chosenwords, input)) then
            channel:send(Escape["red"] .. "You already tried that word." .. Escape["none"])
        end
        channel:send("Input a valid word of length 5:\n")
        io.flush()
        input = io.read() 
    end
    chosenwords[i] = input
    return input
end

function write_terminal(msg, matches, channel)
    local guessed = 0
    channel:send(Escape["none"])
    for i=1,#msg do
        local esc = Escape["red"]
        if matches[i].well_placed then
            esc = Escape["green"]
            guessed = guessed + 1
        elseif matches[i].included then
            esc = Escape["yellow"]
        end

        channel:send(esc .. msg:sub(i,i) .. " " .. Escape["none"] )
    end
    return guessed == #msg
end

function main_menu()
    local correct = false
    local input
    while not correct do
        print_banner()
        io.flush()
        input = read_option()
        if(input == "1" or input == "2") then correct = true end
    end
    return input
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


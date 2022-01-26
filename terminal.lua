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
    ["Play"] = 2,
    ["Exit"] = 1
}
table.sort(menu_options, function(a, b) return a.value < b.value end)

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
    local selected = read_option()
    if selected == menu_options[].value then
        play_game()
    else
        os.exit()
    end
end

function read_option()
    for i=1,#menu_options do
        print(escape["red"]..menu_options[i].value..". "..escape["none"]..menu_options[i].title)
    end
    io.write("Select an option: ")
    io.flush()
    return io.read()
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

function play_game()
    while tries >= 0 do
        local input = read_terminal(worldlet_word_table)
        print("Tries left: " .. tries .. " ")
        write_terminal(input)
        tries = tries-1
    end
end
local colors = {
    {
        title = 'Red',
        color = 'ff0000',
    },
    {
        title = 'Green',
        color = '00ff00',
    },
    {
        title = 'Dust',
        color = 'ab9c38',
    }, -- and many more
}
local startLine = '\124'
local endLine = '\124r'

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

    print(startLine .. colors[1].color .. msg .. endLine)
end

write_terminal("Hola")
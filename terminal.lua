

function readTerminal(list)
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

print(readTerminal())
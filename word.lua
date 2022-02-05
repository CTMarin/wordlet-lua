--[[
    Devuelve un diccionario con la siguiente estructura con cada uno 
    de los caracteres de la palabra guess
    [
        nil,
        {
            "character": "c",
            "included": true
            "well_placed": true
        },
        {
            "character": "a",
            "well_placed": false
        },
        {
            "character": "e",
            "well_placed": true
        }
    ]
--]]
function Matching_characters(guess,correct)
    local result = {}
    local tempind = 1

    for index_guess = 1, 5 do
        local character = guess:sub(index_guess,index_guess)
        local index_correct = string.find(correct,character)
        local temp = nil
        if index_correct == tempind then
            correct = string.sub(correct, 2)
            tempind = tempind - 1
            temp = {
                ['character'] = character,
                included = true,
                well_placed = true
            }
            
        elseif string.match(correct, character) then
            temp = {
                ['character'] = character,
                included = true,
                well_placed = false
            }
        else
            temp = {
                ['character'] = character,
                included = false,
                well_placed = false
            }
        end

        tempind  = tempind + 1
        result[index_guess] = temp
    end
    return result
end
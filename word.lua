--[[
    Devuelve un diccionario con la siguiente estructura con cada uno 
    de los caracteres de la palabra guess
    [
        nil,
        {
            "character": "c",
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

    for index_guess = 1,#guess do
        local character = guess:sub(index_guess,index_guess)
        local index_correct = string.find(correct,character)
        local temp = nil
        if index_correct == index_guess then
            temp = {
                ['character'] = character,
                well_placed = true
            }
        elseif index_guess == nil then
            temp = {
                ['character'] = character,
                well_placed = false
            }
        end
        result[index_guess] = temp
    end
    return result
end
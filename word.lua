--[[
    Devuelve un diccionario con la siguiente estructura
    [
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

    for index_correct = 1,#correct do
        local character = correct:sub(index_correct,index_correct)
        local index_guess = string.find(guess,character)
        if index_correct == index_guess then
            local temp = {
                ['character'] = character,
                well_placed = true
            }
            result[#result+1] = temp
        elseif index_guess == nil then
            local temp = {
                ['character'] = character,
                well_placed = false
            }
            result[#result+1] = temp
        end
    end
    return result
end
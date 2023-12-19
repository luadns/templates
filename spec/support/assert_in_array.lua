local assert = require "luassert"
local say = require("say")

-- Usage:
-- assert.in_array({ type="A" }, records)
-- assert.not_in_array({ type="CNAME" }, records)

local function in_array(state, arguments)
    local element = arguments[1]
    local array = arguments[2]

    for _, item in ipairs(array) do
        local found = true
        local t1, t2 = type(item), type(element)

        -- Compare types
        if t1 ~= t2 then break end

        -- Compare values
        if t1 == 'table' then
            for k, v in pairs(element) do
                if item[k] ~= v then found = false end
            end
        else
            if item ~= element then found = false end
        end

        if found then return true end
    end

    return false
end


say:set("assertion.in_array.positive",
    "Expected element %s to be a value in array:\n%s")

say:set("assertion.in_array.negative",
    "Expected element %s to not be a value in array:\n%s")

assert:register("assertion", "in_array", in_array,
    "assertion.in_array.positive",
    "assertion.in_array.negative")

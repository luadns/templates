T = require "google_workspace"

local records = T:records("penguin.ro")

for _, r in ipairs(records) do
    for key, value in pairs(r) do
        print(key, value)
    end
end

for key, value in pairs(T) do
    print(key, value)
end

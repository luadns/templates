T = require "services.wordpress"

describe("WordPress", function()
    it("should create alias record", function()
        local records = T:records("yourgroovysite")

        assert.are.in_array({
            name = "",
            type = "ALIAS",
            content = "yourgroovysite.wordpress.com",
        }, records)
    end)
end)

T = require "services.netlify"

describe("Netlify", function()
    it("should create apex alias record", function()
        local records = T:records("mysite")

        assert.in_array({
            name = "",
            type = "ALIAS",
            content = "mysite.netlify.app",
        }, records)
    end)

    it("should create www cname record", function()
        local records = T:records("mysite")

        assert.in_array({
            name = "www",
            type = "CNAME",
            content = "mysite.netlify.app",
        }, records)
    end)
end)

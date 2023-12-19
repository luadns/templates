T = require "templates.github_pages"

describe("GitHub Pages", function()
    it("should create apex alias record", function()
        local records = T:records("myuser")

        assert.are.in_array({
            name = "",
            type = "ALIAS",
            content = "myuser.github.io",
        }, records)
    end)
end)

T = require "templates.google_workspace"

describe("Google Workspace", function()
    it("should create mail cname record", function()
        local records = T:records()

        assert.in_array({
            name = "mail",
            type = "CNAME",
            content = "ghs.googlehosted.com",
        }, records)
    end)

    it("should create calendar cname record", function()
        local records = T:records()

        assert.in_array({
            name = "calendar",
            type = "CNAME",
            content = "ghs.googlehosted.com",
        }, records)
    end)

    it("should create aspmx mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "1 aspmx.l.google.com",
        }, records)
    end)

    it("should create alt1 mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "5 alt1.aspmx.l.google.com",
        }, records)
    end)

    it("should create alt2 mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "5 alt2.aspmx.l.google.com",
        }, records)
    end)

    it("should create alt3 mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "10 alt3.aspmx.l.google.com",
        }, records)
    end)

    it("should create alt4 mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "10 alt3.aspmx.l.google.com",
        }, records)
    end)
end)

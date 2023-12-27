T = require "services.mailgun"

describe("Mailgun", function()
    it("should create email cname record", function()
        local records = T:records()

        assert.in_array({
            name = "email",
            type = "CNAME",
            content = "mailgun.org",
        }, records)
    end)

    it("should create mxa mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "10 mxa.mailgun.org",
        }, records)
    end)

    it("should create mxb mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "10 mxb.mailgun.org",
        }, records)
    end)
end)

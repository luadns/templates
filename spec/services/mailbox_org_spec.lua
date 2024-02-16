T = require "services.mailbox_org"

describe("Mailbox.org", function()
    it("should create dkim cname record", function()
        local records = T:records()

        assert.in_array({
            name = "MBO0001._domainkey",
            type = "CNAME",
            content = "MBO0001._domainkey.mailbox.org",
        }, records)
    end)

    it("should create mxa mx record", function()
        local records = T:records()

        assert.in_array({
            name = "",
            type = "MX",
            content = "10 mxext1.mailbox.org"
        }, records)
    end)

end)

T = require "services.migadu"

describe("Migadu", function()
    it("should create dkim cname record", function()
        local records = T:records("beepboop")

        assert.in_array({
            name = "key1._domainkey",
            type = "CNAME",
            content = 'key1.' .. _a .. '._domainkey.migadu.com.',
        }, records)
    end)

    it("should create mxa mx record", function()
        local records = T:records("beepboop")

        assert.in_array({
            name = "",
            type = "MX",
            content = "10 aspmx1.migadu.com",
        }, records)
    end)

    it("should create txt verification record", function()
        local records = T:records("beepboop")

        assert.in_array({
            name = "",
            type = "TXT",
            content = "hosted-email-verify=beepboop",
        }, records)
    end)
end)

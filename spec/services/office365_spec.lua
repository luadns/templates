T = require "services.office365"

local code = "MS=ms77882608"
local mx_host = "example-com"

describe("Office 365", function()
    it("should create verification txt record", function()
        local records = T:records(code, mx_host)

        assert.in_array({
            name = "",
            type = "TXT",
            content = "MS=ms77882608",
        }, records)
    end)

    it("should create exchange online records", function()
        local records = T:records(code, mx_host)

        assert.in_array({
            name = "autodiscover",
            type = "CNAME",
            content = "autodiscover.outlook.com",
        }, records)

        assert.in_array({
            name = "",
            type = "MX",
            content = "0 example-com.mail.protection.outlook.com",
        }, records)
    end)

    it("should create mdm records", function()
        local records = T:records(code, mx_host)

        assert.in_array({
            name = "enterpriseregistration",
            type = "CNAME",
            content = "enterpriseregistration.windows.net",
        }, records)

        assert.in_array({
            name = "enterpriseenrollment",
            type = "CNAME",
            content = "enterpriseenrollment.manage.microsoft.com",
        }, records)
    end)

    it("should create teams records", function()
        local records = T:records(code, mx_host)

        assert.in_array({
            name = "sip",
            type = "CNAME",
            content = "sipdir.online.lync.com",
        }, records)

        assert.in_array({
            name = "lyncdiscover",
            type = "CNAME",
            content = "webdir.online.lync.com",
        }, records)

        assert.in_array({
            name = "_sip._tls",
            type = "SRV",
            content = "100 1 443 sipdir.online.lync.com",
        }, records)

        assert.in_array({
            name = "_sipfederationtls._tcp",
            type = "SRV",
            content = "100 1 5061 sipfed.online.lync.com",
        }, records)
    end)
end)

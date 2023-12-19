T = require "templates.shopify"

describe("Shopify", function()
    it("should create records", function()
        local records = T:records("example.com")

        assert.are.same({
            {
                name = "",
                type = "A",
                content = "23.227.38.65",
                ttl = 3600,
            },
            {
                name = "www",
                type = "CNAME",
                content = "shops.myshopify.com",
                ttl = 3600,
            }
        }, records)
    end)
end)

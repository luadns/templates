local M       = {}

M.name        = "Shopify"
M.description = "Shopify stores"
M.category    = "ecommerce"
M.fields      = {}
M.records     = function(_)
    return {
        a("", "23.227.38.65"),
        cname("www", "shops.myshopify.com"),
    }
end

return M

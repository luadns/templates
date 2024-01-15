local M       = {}

M.name        = "WordPress"
M.description = "WordPress website hosted by WordPress"
M.category    = "hosting"
M.fields      = {
    {
        name = "site",
        label = "WordPress Subdomain",
        description = "Your WordPress subdomain, example: yourgroovysite",
    },
}
M.records     = function(_, site)
    return {
        alias("", site .. ".wordpress.com"),
    }
end

return M

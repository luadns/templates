local M       = {}

M.name        = "Netlify"
M.description = "The premium hosting service for modern static websites."
M.category    = "hosting"
M.fields      = {
    {
        name = "site",
        label = "Netlify Site Name",
        description = "Your Netlify site name, example: mysite.netlify.app",
    },
}
M.records     = function(_, site)
    return {
        alias("", site .. ".netlify.app"),
        cname("www", site .. ".netlify.app"),
    }
end

return M

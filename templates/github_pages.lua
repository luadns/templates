local M       = {}

M.name        = "GitHub Pages"
M.description = "Static pages hosted by GitHub"
M.category    = "hosting"
M.fields      = {
    {
        name = "username",
        label = "GitHub Username",
        description = "Your GitHub username, example: myuser.netlify.app",
    },
}
M.records     = function(_, username)
    return {
        alias("", username .. ".github.io"),
    }
end

return M

M = {}

github_pages = require "templates.github_pages"
google_workspace = require "templates.google_workspace"
netlify = require "templates.netlify"
shopify = require "templates.shopify"

table.unpack = table.unpack or unpack -- 5.1 compatibility

M.github_pages = function(_, ...)
    local arg = { ... }
    return github_pages:records(table.unpack(arg))
end

M.google_workspace = function(_, ...)
    local arg = { ... }
    return google_workspace.records(table.unpack(arg))
end

M.netlify = function(_, ...)
    local arg = { ... }
    return netlify.records(table.unpack(arg))
end

M.shopify = function(_, ...)
    local arg = { ... }
    return shopify.records(table.unpack(arg))
end

return M

M = {}

local github_pages = require "services.github_pages"
local google_workspace = require "services.google_workspace"
local mailbox_org = require "services.mailbox_org"
local mailgun = require "services.mailgun"
local migadu = require "services.migadu"
local netlify = require "services.netlify"
local office365 = require "services.office365"
local shopify = require "services.shopify"
local wordpress = require "services.wordpress"

table.unpack = table.unpack or unpack -- 5.1 compatibility

M.github_pages = function(_, ...)
    local arg = { ... }
    return github_pages:records(table.unpack(arg))
end

M.google_workspace = function(_, ...)
    local arg = { ... }
    return google_workspace:records(table.unpack(arg))
end

M.mailbox_org = function(_, ...)
    local arg = { ... }
    return mailbox_org:records(table.unpack(arg))
end

M.mailgun = function(_, ...)
    local arg = { ... }
    return mailgun:records(table.unpack(arg))
end

M.migadu = function(_, ...)
    local arg = { ... }
    return migadu:records(table.unpack(arg))
end

M.netlify = function(_, ...)
    local arg = { ... }
    return netlify:records(table.unpack(arg))
end

M.office365 = function(_, ...)
    local arg = { ... }
    return office365:records(table.unpack(arg))
end

M.shopify = function(_, ...)
    local arg = { ... }
    return shopify:records(table.unpack(arg))
end

M.wordpress = function(_, ...)
    local arg = { ... }
    return wordpress:records(table.unpack(arg))
end

return M

local M       = {}
local dns     = require "dns"

M.name        = "Google Workspace"
M.description = "Google Workspace records."
M.fields      = {}
M.records     = function(_)
    return {
        dns:cname("mail", "ghs.googlehosted.com"),
        dns:cname("calendar", "ghs.googlehosted.com"),
        dns:mx("", "aspmx.l.google.com", 1),
        dns:mx("", "alt1.aspmx.l.google.com", 5),
        dns:mx("", "alt2.aspmx.l.google.com", 5),
        dns:mx("", "alt3.aspmx.l.google.com", 10),
        dns:mx("", "alt4.aspmx.l.google.com", 10),
    }
end

return M

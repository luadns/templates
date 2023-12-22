local M       = {}

M.name        = "Google Workspace"
M.description = "Google Workspace records."
M.category    = "productivity"
M.fields      = {}
M.records     = function(_)
    return {
        cname("mail", "ghs.googlehosted.com"),
        cname("calendar", "ghs.googlehosted.com"),
        mx("", "aspmx.l.google.com", 1),
        mx("", "alt1.aspmx.l.google.com", 5),
        mx("", "alt2.aspmx.l.google.com", 5),
        mx("", "alt3.aspmx.l.google.com", 10),
        mx("", "alt4.aspmx.l.google.com", 10),
    }
end

return M

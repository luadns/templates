local M       = {}

M.name        = "Mailgun"
M.description = "Mailgun is email delivery service for sending, receiving, and tracking emails."
M.category    = "email"
M.fields      = {}
M.records     = function(_)
    return {
        -- Domain used for link tracking
        cname("email", "mailgun.org"),

        -- Receiving MX servers, required for receiving.
        mx("", "mxa.mailgun.org", 10),
        mx("", "mxb.mailgun.org", 10),

        -- SPF record, this required for sending.
        -- The `include:mailgun.org` should be merged with other domain settings.
        -- txt("", "v=spf1 include:mailgun.org ~all")
    }
end

return M

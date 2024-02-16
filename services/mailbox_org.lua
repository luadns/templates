local M       = {}

M.name        = "Mailbox.org"
M.description = "Mailbox.org is an email hosting provider."
M.category    = "email"
M.fields      = {}
M.records     = function(_)
    return {
        -- Receiving MX servers, required for receiving.
        mx("", "mxext1.mailbox.org", 10),
        mx("", "mxext2.mailbox.org", 20),
        mx("", "mxext3.mailbox.org", 30),

        -- DMARC and DKIM, required for sending.
        -- Config taken from:
        -- https://kb.mailbox.org/en/private/custom-domains/spf-dkim-and-dmarc-how-to-improve-the-spam-reputation-of-your-domain
        -- txt("_dmarc", "v=DMARC1; p=quarantine;"),
        cname("MBO0001._domainkey", "MBO0001._domainkey.mailbox.org"),
        cname("MBO0002._domainkey", "MBO0002._domainkey.mailbox.org"),
        cname("MBO0003._domainkey", "MBO0003._domainkey.mailbox.org"),
        cname("MBO0004._domainkey", "MBO0004._domainkey.mailbox.org"),
    }
end

return M

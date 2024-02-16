local M       = {}

M.name        = "Migadu"
M.description = "Migadu.com is an email hosting provider."
M.category    = "email"
M.fields      = {
    {
        name = "verification_record",
        label = "Migadu verification record",
        description = "The verification TXT record's value here: hosted-email-verify=<value>",
    },
}
M.records     = function(_, verification_record)
    return {
        -- Receiving MX servers, required for receiving.
        mx("", "aspmx1.migadu.com", 10),
        mx("", "aspmx2.migadu.com", 20),

        -- DMARC and DKIM, required for sending.
        -- txt("_dmarc", "v=DMARC1; p=quarantine;"),
        cname('key1._domainkey', 'key1.' .. _a .. '._domainkey.migadu.com.'),
        cname('key2._domainkey', 'key2.' .. _a .. '._domainkey.migadu.com.'),
        cname('key3._domainkey', 'key3.' .. _a .. '._domainkey.migadu.com.'),

        -- Migadu uses a verification record, available (when logged in) from:
        -- https://admin.migadu.com/domains/109975/dns/instructions
        txt("", 'hosted-email-verify=' .. verification_record),

        -- Additional SRV records required by this service
        srv("_submissions._tcp", "smtp.migadu.com", 465),
        srv("_imaps._tcp", "imap.migadu.com", 993),
    }
end

return M

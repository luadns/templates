local M       = {}

M.name        = "Migadu"
M.description = "Migadu is an email hosting provider."
M.category    = "email"
M.fields      = {}
M.records     = function(_, verification_record)
    return {
        -- Receiving MX servers, required for receiving.
        mx("", "aspmx1.migadu.com.", 10)
        mx("", "aspmx2.migadu.com.", 20)

        -- SPF record, DMARC and DKIM, required for sending.
        txt("_dmarc', 'v=DMARC1; p=quarantine;")
        txt("", 'v=spf1 include:spf.migadu.com -all')
        cname('key1._domainkey.' .. _a, 'key1.' .. _a .. '._domainkey.migadu.com.')
        cname('key2._domainkey.' .. _a, 'key2.' .. _a .. '._domainkey.migadu.com.')
        cname('key3._domainkey.' .. _a, 'key3.' .. _a .. '._domainkey.migadu.com.')

        -- Migadu uses a verification record, available (when logged in) from:
        -- https://admin.migadu.com/domains/109975/dns/instructions
        txt("", 'hosted-email-verify=' .. verification_record)

        -- Additional SRV records required by this service
        srv(concat('_submissions._tcp', _a), 'smtp.migadu.com', 465)
        srv(concat('_imaps._tcp', _a), 'imap.migadu.com', 993)
    }
end

local M       = {}

M.name        = "Office 365"
M.description = "Productivity software, collaboration and cloud-based services from Microsoft."
M.category    = "productivity"
M.fields      = {
    {
        name = "verification",
        label = "Verification",
        description = "Your Office 365 verification code, example: MS=ms77882608",
    },
    {
        name = "mx_host",
        label = "MX Record",
        description = "Your Office 365 MX record, example: example-com",
    }
}

M.records     = function(_, verfication, mx_host)
    return {
        -- Core services
        txt("", verfication),

        -- Exchange Online
        cname("autodiscover", "autodiscover.outlook.com"),
        mx("", mx_host .. ".mail.protection.outlook.com"),

        -- MDM records
        cname("enterpriseregistration", "enterpriseregistration.windows.net"),
        cname("enterpriseenrollment", "enterpriseenrollment.manage.microsoft.com"),

        -- Teams
        cname("sip", "sipdir.online.lync.com"),
        cname("lyncdiscover", "webdir.online.lync.com"),
        srv("_sip._tls", "sipdir.online.lync.com", 443, 100, 1),
        srv("_sipfederationtls._tcp", "sipfed.online.lync.com", 5061, 100, 1),

        -- TODO: Add to SPF record include:spf.protection.outlook.com
    }
end

return M

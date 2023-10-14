local M = {}

function M:cname(domain, target, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "CNAME",
        content = target,
        ttl = ttl
    }
end

function M:mx(domain, exchanger, prio, ttl)
    prio = prio or 0
    ttl = ttl or 3600
    return {
        name = domain,
        type = "MX",
        content = prio .. " " .. exchanger,
        ttl = ttl
    }
end

return M

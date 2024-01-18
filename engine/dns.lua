-- Global variables
_a = "example.com"

-- Global functions
function a(domain, addr, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "A",
        content = addr,
        ttl = ttl
    }
end

function aaaa(domain, addr, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "AAAA",
        content = addr,
        ttl = ttl
    }
end

function alias(domain, target, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "ALIAS",
        content = target,
        ttl = ttl
    }
end

function caa(domain, value, tag, flag, ttl)
    tag = tag or "issue"
    flag = flag or 0
    ttl = ttl or 3600
    return {
        name = domain,
        type = "CAA",
        content = table.concat({ flag, tag, value }, " "),
        ttl = ttl
    }
end

function cname(domain, target, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "CNAME",
        content = target,
        ttl = ttl
    }
end

function ds(domain, keytag, digest, algorithm, digest_type, ttl)
    algorithm = algorithm or 13
    digest_type = digest_type or 2
    ttl = ttl or 3600
    return {
        name = domain,
        type = "DS",
        content = table.concat({ keytag, algorithm, digest_type, digest }, " "),
        ttl = ttl
    }
end

function forward(domain, to, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "FORWARD",
        content = to,
        ttl = ttl
    }
end

function mx(domain, exchanger, prio, ttl)
    prio = prio or 0
    ttl = ttl or 3600
    return {
        name = domain,
        type = "MX",
        content = table.concat({ prio, exchanger }, " "),
        ttl = ttl
    }
end

function ns(domain, server, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "NS",
        content = server,
        ttl = ttl
    }
end

function ptr(domain, host, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "PTR",
        content = host,
        ttl = ttl
    }
end

function redirect(domain, target, mode, ttl)
    mode = mode or 0
    ttl = ttl or 3600
    return {
        name = domain,
        type = "REDIRECT",
        content = table.concat({ mode, target }, " "),
        ttl = ttl
    }
end

function spf(domain, text, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "SPF",
        content = text,
        ttl = ttl
    }
end

function srv(domain, target, port, prio, weight, ttl)
    prio   = prio or 0
    weight = weight or 0
    ttl    = ttl or 3600
    return {
        name = domain,
        type = "SRV",
        content = table.concat({ prio, weight, port, target }, " "),
        ttl = ttl
    }
end

function sshfp(domain, algorithm, fp_value, fp_type, ttl)
    fp_type = fp_type or 1
    ttl = ttl or 3600
    return {
        name = domain,
        type = "SSFHP",
        content = table.concat({ algorithm, fp_type, fp_value }, " "),
        ttl = ttl
    }
end

function tlsa(domain, usage, certificate, selector, matching_type, ttl)
    selector = selector or 1
    matching_type = matching_type or 1
    ttl = ttl or 3600
    return {
        name = domain,
        type = "TLSA",
        content = table.concat({ usage, selector, matching_type, certificate }, " "),
        ttl = ttl
    }
end

function txt(domain, text, ttl)
    ttl = ttl or 3600
    return {
        name = domain,
        type = "TXT",
        content = text,
        ttl = ttl
    }
end

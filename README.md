# Templates

- [![Actions Status](https://github.com/luadns/templates/workflows/CI/badge.svg)](https://github.com/luadns/templates/actions)

System templates for common services.


## Services

* [GitHub Pages](services/github_pages.lua)
* [Google Workspace](services/google_workspace.lua)
* [Mailbox.org](services/mailbox_org.lua)
* [Mailgun](services/mailgun.lua)
* [Migadu](services/migadu.lua)
* [Netlify](services/netlify.lua)
* [Office 365](services/office365.lua)
* [Shopify](services/shopify.lua)
* [WordPress](services/wordpress.lua)

## Usage

```lua
-- File: example.com.lua
-- Zone: example.com

-- Load system templates.
local templates = require("templates")

-- Add Google Workspace records.
templates:google_workspace()

-- Host example.com on GitHub Pages (myuser.github.io).
templates:github_pages("myuser")
```

## Code Structure

The templates are organized as Lua packages in the [services](services) directory.

* templates.lua - contains a wrapper function with service_name for each service
* services/service_name.lua - a package containing metadata and two functions `fields` and `records`
* spec/services/service_name_spec.lua - unit tests for the package

Example:

* [templates.lua](templates.lua) - see github_pages function
* [services/github_pages.lua](services/github_pages.lua)
* [spec_services/github_pages_spec.lua](spec/services/github_pages_spec.lua)

## Development

For templates development you need to install [Lua](https://www.lua.org) v5.1 and [luarocks](https://luarocks.org) package manager.

Run `make setup` to install packages required to run the unit tests.

```bash
$ make setup
luarocks install busted
Installing https://luarocks.org/busted-2.2.0-1.src.rock
[...]
Stopping after installing dependencies for luadns-templates dev-1
```

Run `make test` to execute the unit tests.

```bash
$ make test
[...]
20 successes / 0 failures / 0 errors / 0 pending : 0.013063 seconds
```

## DKIM

The following services requires setting a DKIM policy to work properly:

* Google Workspace
* Mailbox.org
* Migadu

The DKIM uses published keys in the DNS or IP addresses specified in the SPF
record to authenticate emails. The DKIM policy has precedence over SPF policy.

A typical policy would be to `quarantine`, this applies to the domain and all
its subdomains without an explicit policy.

```lua
-- Deliver authenticated emails in the Inbox and others in the Spam/Junk folder.
txt("_dmarc", "v=DMARC1; p=quarantine;"),
```

## Contributing

To add a new template fork the repository and create a pull request.

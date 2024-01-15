# Templates

- [![Actions Status](https://github.com/luadns/templates/workflows/CI/badge.svg)](https://github.com/luadns/templates/actions)

System templates for common services.


## Services

* [GitHub Pages](templates/github_pages.lua)
* [Google Workspace](templates/google_workspace.lua)
* [Mailgun](templates/mailgun.lua)
* [Netlify](templates/netlify.lua)
* [Office 365](templates/office365.lua)
* [Shopify](templates/shopify.lua.lua)

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

## Contributing

To add a new template fork the repository and create a pull request.

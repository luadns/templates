# Templates

- [![Actions Status](https://github.com/luadns/templates/workflows/CI/badge.svg)](https://github.com/luadns/templates/actions)

System templates for common services.


## Services

* [GitHub Pages](templates/github_pages.lua)
* [Google Workspace](templates/google_workspace.lua)
* [Netlify](templates/netlify.lua)
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

rockspec_format = "3.0"
package = "luadns-templates"
version = "dev-1"

source = {
  url = "git@github.com:luadns/templates.git",
}

description = {
  summary = "LuaDNS global templates",
  homepage = "<https://www.luadns.com>",
  detailed = "<https://www.luadns.com>",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1",
  "say >= 1.4.0-1"
}

test_dependencies = {
  "busted",
}

test = {
  type = "busted",
}

build = {
  type = "none",
}

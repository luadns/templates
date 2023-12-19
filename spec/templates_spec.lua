T = require "templates"

describe("Templates", function()
	it("github_pages should call records from module", function()
		local records = T:github_pages("myuser")

		assert.are.same({
			{
				name = "",
				type = "ALIAS",
				content = "myuser.github.io",
				ttl = 3600,
			}
		}, records)
	end)
end)

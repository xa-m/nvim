-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {},
	config = function()
		local autopairs = require("nvim-autopairs")
		autopairs.setup({})

		local Rule = require("nvim-autopairs.rule")

		autopairs.add_rules({
			Rule("|", "|", "zig")
				:with_pair(function(opts)
					-- Only add pair if the previous char isn't already |
					local prev_char = opts.line:sub(opts.col - 1, opts.col - 1)
					return prev_char ~= "|"
				end)
				:with_move(function(opts)
					-- Move past the closing | if it's already there
					return opts.prev_char:match("|") ~= nil
				end)
				:use_key("|"),
		})
	end,
}

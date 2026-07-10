return {
	"olimorris/codecompanion.nvim",
	version = "^19.0.0",
	opts = {
		interactions = {
			cli = {
				agent = "claude_code",
				agents = {
					claude_code = {
						cmd = "claude",
						args = {},
						description = "Claude Code CLI",
						provider = "terminal",
					},
				},
			},
			inline = {
				adapter = "claude_code",
			},
			chat = {
				adapter = "claude_code",
			},
		},
		adapters = {
			acp = {
				claude_code = function()
					return require("codecompanion.adapters").extend("claude_code", {
						env = {
							CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
						},
					})
				end,
			},
		}
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}

return {
	"olimorris/codecompanion.nvim",
	version = "^19.0.0",
	opts = {
		interactions = {
			cli = { adapter = "lmstudio" },
			inline = { adapter = "lmstudio" },
			chat = { adapter = "lmstudio" }
		},
		adapters = {
			http = {
				lmstudio = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						name = "lmstudio",
						env = {
							url = "http://localhost:1234",
							api_key = "lm-studio", -- LM Studio doesn't check this, just needs to be present
						},
						schema = {
							model = {
								default = "qwen/qwen3-coder-30b", -- must match what LM Studio reports
							},
						},
					})
				end,
			},
		},
		extensions = {
			spinner = {
				opts = {
					style = "cursor-relative",
				},
			},
		}
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"lalitmee/codecompanion-spinners.nvim"
	},
}



require'nvim-treesitter.configs'.setup {
ensure_installed = {'javascript', 'typescript', 'tsx', 'jsdoc'}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  autopairs = {     -- autopairs integration
		enable = true,
	},
	indent = {
    enable = true,
    disable = { "yaml", "python", "css" }
  },
	context_commentstring = {    -- nvim-ts-context integration
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true,
		disable = { "xml" },
	},
	rainbow = {           -- ts-rainbow integration for coloring (){}
		enable = false,
		disable = { "html" },
	},
}


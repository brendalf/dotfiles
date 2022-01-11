if !exists('g:loaded_nvim_treesitter')
	finish
endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {}
	},
	ident = {
		enable = true,
		disable = {}
	},
	ensure_installed = {
		"tsx",
		"toml",
		"fish",
		"json",
		"yaml",
		"html",
		"scss",
		"python",
		"javascript",
		"elixir"
	}
}
EOF

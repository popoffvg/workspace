--require'nvim-treesitter.install'.compilers = {"musl-gcc"}
--require'nvim-treesitter.parsers'.command_extra_args = {["musl-gcc"] = {"-static-libgcc"}}

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
          "go",
		"bash",
	--	"dockerfile",
		"glsl",
		"hcl",
		"javascript",
		"json",
	--	"lua",
		"toml",
		"typescript",
	--	"vim",
		"yaml",
		"python"
	},

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  highlight = {
   enable = true,
   additional_vim_regex_highlighting = false,
  },
}

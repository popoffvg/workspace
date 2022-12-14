local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
	initial_mode = "insert",
	file_ignore_patterns = {"node%_modules", "vendor", "%.git"}
  }
}

require('telescope').load_extension("fzf")
require('telescope').load_extension("git_worktree")

-- require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })
-- require('telescope.builtin').live_grep( { cwd = vim.fn.expand('%:p:h') })

keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>of", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>ft", ":Telescope treesitter<CR>", opts)
keymap("n", "<leader>fc", ":Telescope commands<CR>", opts)
keymap("n", "<leader>fr", ":Telescope resume<CR>", opts)

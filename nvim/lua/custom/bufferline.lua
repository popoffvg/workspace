
local ok, bufline = pcall(require, "bufferline")

bufline.setup({
	options = {
		diagnostics = "nvim_lsp",
        show_tab_indicators = true,   
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
	},
})

vim.cmd[[
nnoremap <silent> <Leader><Tab> :BufferLinePick<CR>
]]

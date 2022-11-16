
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.cmd [[
    let g:go_list_type="quickfix"
    let g:go_fmt_command="goimports"
    let g:go_highlight_types=1
    let g:go_highlight_fields=1
    let g:go_highlight_functions=1
    let g:go_highlight_function_calls=1
    let g:go_fmt_fail_silently=1
    let g:go_bin_path = $HOME."/go/bin"
    let g:go_gopls_gofumpt = 1

    augroup go

      au!
      au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
      au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
      au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
      au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

      au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
      au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
      au FileType go nmap <Leader>db <Plug>(go-doc-browser)

      au FileType go nmap <leader>r  <Plug>(go-run)
      au FileType go nmap <leader>t  <Plug>(go-test)
      au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
      au FileType go nmap <Leader>i <Plug>(go-info)
      au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
      au FileType go nmap <C-g> :GoDecls<cr>
      au FileType go nmap <leader>gd :GoDeclsDir<cr>
      au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
      au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
      au FileType go nmap <leader>gi <esc>:<C-u>GoImplemets<cr>
      au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

    augroup END
]]

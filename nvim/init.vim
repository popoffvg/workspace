set relativenumber
set rnu
set clipboard=unnamedplus

let mapleader=' '


let vimplug_exists=expand('~/./autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  filetype off
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Common keybindings
inoremap jj <Esc>l
map <c-w> :bd<CR>
imap <a-o> <Esc>o
imap <a-a> <Esc>a
imap <a-O> <Esc>O
imap <a-A> <Esc>A
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

call plug#begin(expand('~/./plugged'))
    " Language
    Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'j-hui/fidget.nvim'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'rafamadriz/friendly-snippets'
	Plug 'ray-x/lsp_signature.nvim'

    " Base
    Plug 'akinsho/toggleterm.nvim'
    Plug 'antoinemadec/FixCursorHold.nvim'
    Plug 'sindrets/diffview.nvim'
    Plug 'APZelos/blamer.nvim'

    " Navigation
    Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
    " Plug 'preservim/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'akinsho/bufferline.nvim'
    Plug 'MattesGroeger/vim-bookmarks'

    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
    Plug 'karb94/neoscroll.nvim'
    " Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
    " Plug 'gnikdroy/projections.nvim'

    " View
    Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 	Plug 'lukas-reineke/indent-blankline.nvim'
    " Plug 'vim-airline/vim-airline'
    Plug 'majutsushi/tagbar'
    Plug 'nvim-lualine/lualine.nvim'

	" Git
	Plug 'ThePrimeagen/git-worktree.nvim'
	Plug 'TimUntersberger/neogit'
	Plug 'lewis6991/gitsigns.nvim'

	" Edit
	Plug 'tpope/vim-surround'
	Plug 'windwp/nvim-autopairs'
	Plug 'numToStr/Comment.nvim'
    Plug '907th/vim-auto-save'

    " LSP
    " Plug 'Shougo/deoplete.nvim'
    " Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'nvim-treesitter/nvim-treesitter'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Go
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'ray-x/go.nvim'
    " Plug 'ray-x/guihua.lua' 

    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    " Others
    Plug 'tanvirtin/monokai.nvim'
    Plug 'vim-test/vim-test'
    Plug 'folke/todo-comments.nvim', {'branch': 'neovim-pre-0.8.0'}

call plug#end()
lua << EOF
    require "custom.autopairs"
    require "custom.lsp"
    require "custom.treesitter"
    require "custom.autosave"
    require "custom.bufferline"
    -- require "custom.go"
    require "custom.cmp"
	require "custom.plugins"
    require "custom.telescope"
    require "custom.terminal"
    require "custom.tree"
    require "custom.saga"
    require "custom.comments"
    -- require "custom.projects"
EOF
"
"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set nocompatible
syntax on
filetype off
filetype plugin indent on
set runtimepath+=$GOROOT/misc/vim
set ruler
set number

let no_buffers_menu=1
colorscheme monokai


" Better command line completion 
set wildmenu

" mouse support
set mouse=a

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

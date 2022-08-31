" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.

"Plug 'neovim/nvim-lspconfig'
"Plug 'folke/lsp-colors.nvim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'Konfekt/FastFold'
Plug 'lervag/vimtex'
Plug 'arcticicestudio/nord-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'bfrg/vim-cpp-modern'
Plug 'suoto/hdl_checker'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

set termguicolors
syntax on

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

set nocompatible
let &rtp  = '~/.vim/bundle/vimtex,' . &rtp
let &rtp .= ',~/.vim/bundle/vimtex/after'
filetype plugin indent on
syntax enable

let g:tex_flavor = "latex"
let g:vimtex_latexmk_background  = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options 
	\ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

let g:lightline = { 'colorscheme' : 'tokyonight' }

set nocursorline
set number

set mouse=a
source $VIMRUNTIME/mswin.vim

set ignorecase
set foldcolumn=1
set tabstop=4
set shiftwidth=4

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
	set termguicolors
endif

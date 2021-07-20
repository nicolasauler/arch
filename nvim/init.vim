set relativenumber
set nu
set nohlsearch
set hidden
set noshowmode
set nowrap
set nocursorline
set nocompatible
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noswapfile
set incsearch
set scrolloff=8

if (has("termguicolors"))
	set termguicolors
endif

call plug#begin()

	Plug 'lervag/vimtex'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'suoto/hdl_checker'
	Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
	Plug 'neomake/neomake'
	Plug 'itchyny/lightline.vim'
	Plug 'fcpg/vim-orbital'
	Plug 'ghifarit53/tokyonight-vim'

call plug#end()

call deoplete#custom#var('omni', 'input_patterns', {
			\ 'tex': g:vimtex#re#deoplete
			\})

let g:tokyonight_style = 'night' 
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
let g:lightline = {
	\ 'colorscheme' : 'tokyonight',
	\ }
"colorscheme orbital
"let g:lightline = {
	"\ 'colorscheme' : 'PaperColor',
	"\ }
let g:ale_completion_enabled = 1
call neomake#configure#automake('nrwi', 500)


syntax on

let &rtp = '~/plugged/vimtex,' . &rtp
let &rtp .= ',~/plugged/vimtex/after'
filetype plugin indent on
syntax enable

let g:tex_flavor = 'latex'
let g:vimtex_latexmk_background = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options
	\ = '-reuse-instance -forward-search @tex @line @pdf'

let g:vimtex_view_general_options_latexmk = '-reuse-instance'

if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap {<CR> <CR>{<CR>}<ESC>O

inoremap {a {a}<left>
inoremap {e {e}<left>
inoremap {o {o}<left>
inoremap {s {s}<left>
inoremap {r {r}<left>
inoremap {i {i}<left>
inoremap {n {n}<left>
inoremap {d {d}<left>
inoremap {m {m}<left>
inoremap {u {u}<left>
inoremap {t {t}<left>
inoremap {h {h}<left>

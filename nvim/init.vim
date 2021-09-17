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

    " Auto-completion and lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    "Plug 'glepnir/lspsaga.nvim'
    "Plug 'mfussenegger/nvim-jdtls'

    " Tree-sitter
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/playground'

    " Languages
	Plug 'lervag/vimtex'
	Plug 'bfrg/vim-cpp-modern'
	Plug 'suoto/hdl_checker'

	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	
    Plug 'neomake/neomake'
    Plug 'sbdchd/neoformat'

    " Style and aesthetics
	Plug 'itchyny/lightline.vim'
	Plug 'fcpg/vim-orbital'
	Plug 'ghifarit53/tokyonight-vim'

    " PlantUML stuff
    Plug 'aklt/plantuml-syntax'
    Plug 'tyru/open-browser.vim'
    Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()

"call deoplete#custom#var('omni', 'input_patterns', {
"			\ 'tex': g:vimtex#re#deoplete
"			\})
"let g:deoplete#enable_at_startup = 1

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

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

lua << EOF
require'lspconfig'.clangd.setup{}
EOF

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

""nvim_lsp.jdtls.setup{}

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap {<CR> <CR>{<CR>}<ESC>O

inoremap \begin{enumerate} \begin{enumerate}<CR>\end{enumerate}<ESC>O<CR>\item{}<ESC>o
inoremap \begin{itemize} \begin{itemize}<CR>\end{itemize}<ESC>O<CR>\item{}<ESC>o

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

nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

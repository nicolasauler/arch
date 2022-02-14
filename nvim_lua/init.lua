local set = vim.opt

set.relativenumber = true
set.nu = true
set.hidden = true
set.showmode = false
set.wrap = false
set.cursorline = false
set.compatible = false
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.smartindent = true
set.swapfile = false
set.incsearch = true
set.scrolloff = 8

if vim.fn.has('termguicolors') == 1 then
    set.termguicolors = true
end

require "paq" {
    "savq/paq-nvim";

    -- lsps
    "neovim/nvim-lspconfig";
    -- Plug 'williamboman/nvim-lsp-installer'

    -- autocompletion
    "hrsh7th/nvim-cmp";
    {"hrsh7th/cmp-buffer", branch = 'main'};
    {"hrsh7th/cmp-path", branch = 'main'};
    {"hrsh7th/cmp-nvim-lua", branch = 'main'};
    {"hrsh7th/cmp-nvim-lsp", branch = 'main'};
    "saadparwaiz1/cmp_luasnip";

    -- snippets
    "L3MON4D3/LuaSnip";
    "onsails/lspkind-nvim";

    -- colours, style and aesthetics
    "itchyny/lightline.vim";
    {"folke/tokyonight.nvim", branch = 'main'};

    -- PlantUML stuff
    "aklt/plantuml-syntax";
    "tyru/open-browser.vim";
    "weirongxu/plantuml-previewer.vim";

    -- latex
    "lervag/vimtex";
    --{"iamcco/markdown-preview.nvim", opt=true ,run= vim.fn["mkdp#util#install()"] ,as="markdownPreview"};
    --{"iamcco/markdown-preview.nvim", opt=true, as="markdownPreview", run = function() vim.fn['mkdp#util#install']() end };
    --{"iamcco/markdown-preview.nvim", as="markdownPreview", run = function() vim.fn['mkdp#util#install']() end };
    --{"iamcco/markdown-preview.nvim", opt=true, run = function() vim.fn['mkdp#util#install']() end };
    --    {"iamcco/markdown-preview.nvim", opt=true, as="markdownPreview"};
    --{"iamcco/markdown-preview.nvim", as="markdownPreview"};
    --
    --
    { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end };

    -- jupyter_ascending
    "untitled-ai/jupyter_ascending.vim";

    -- 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
    -- ('dccsillag/magma-nvim', do = fn[':UpdateRemotePlugins'])
    -- 'dccsillag/magma-nvim'
}

require('nic.lspconfig')
require('nic.cmp')
require('nic.luasnip')
require('nic.style')
require('nic.vimtex')
require('nic.markdown-preview')

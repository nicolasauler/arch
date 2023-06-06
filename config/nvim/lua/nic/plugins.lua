return {
    { "ellisonleao/gruvbox.nvim", priority = 1000 },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                              , branch = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    "gbprod/yanky.nvim",

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {'nvim-treesitter/playground'},
    {'nvim-treesitter/nvim-treesitter-context'},

    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional
        {'rafamadriz/friendly-snippets'}, -- Optional
    }
}

}

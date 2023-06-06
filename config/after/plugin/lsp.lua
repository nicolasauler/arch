--<<<<<<< HEAD
---- Learn the keybindings, see :help lsp-zero-keybindings
---- Learn to configure LSP servers, see :help lsp-zero-api-showcase
--local lsp = require('lsp-zero')
--lsp.preset('recommended')
--
--lsp.ensure_installed({
--	'rust_analyzer',
--})
--
---- Only define once
--if not require'lspconfig.configs'.hdl_checker then
--  require'lspconfig.configs'.hdl_checker = {
--    default_config = {
--    cmd = {"hdl_checker", "--lsp", };
--    filetypes = {"vhdl", "verilog", "systemverilog"};
--      root_dir = function(fname)
--        -- will look for the .hdl_checker.config file in parent directory, a
--        -- .git directory, or else use the current directory, in that order.
--        local util = require'lspconfig'.util
--        return util.root_pattern('.hdl_checker.config')(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
--      end;
--      settings = {};
--    };
--  }
--end
--
--require'lspconfig'.hdl_checker.setup{}
--
---- Fix Undefined global 'vim'
--lsp.configure('lua-language-server', {
--	settings = {
--		Lua = {
--			diagnostics = {
--				globals = { 'vim' }
--			}
--		}
--	}
--})
--
---- Fix Undefined global 'vim'
--lsp.configure('lua_ls', {
--	settings = {
--		Lua = {
--			diagnostics = {
--				globals = { 'vim' }
--			}
--		}
--	}
--})
--
--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true }),
--	["<C-Space>"] = cmp.mapping.complete(),
--})
--
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil
--
--lsp.setup_nvim_cmp({
--	mapping = cmp_mappings
--})
--
--lsp.set_preferences({
--    suggest_lsp_servers = false,
--    sign_icons = {
--        error = 'E',
--        warn = 'W',
--        hint = 'H',
--        info = 'I'
--    }
--=======
---- Fix Undefined global 'vim'
--lsp.configure('lua_ls', {
--	settings = {
--		Lua = {
--			diagnostics = {
--				globals = { 'vim' }
--			}
--		}
--	}
--})
--
--local cmp_select = {behavior = cmp.SelectBehavior.Select}


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  mapping = {
    -- `Enter` key to confirm completion
    ['<C-y>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil,

  }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

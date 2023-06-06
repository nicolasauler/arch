--require('rose-pine').setup({
--    disable_background = true
--})
--
--function ColorMyPencils(color)
--	color = color or "rose-pine"
--	vim.cmd.colorscheme(color)
--
--	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
--end
--
--ColorMyPencils()

function ColorPlease(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
--	vim.o.background = "dark" -- or "light" for light mode
--	vim.cmd([[colorscheme gruvbox]])

	vim.api.nvim_set_option('background', 'dark')
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.schedule(ColorPlease)

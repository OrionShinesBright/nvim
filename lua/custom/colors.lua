-- COLORS --

vim.cmd("colorscheme vague")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.cmd(":hi statusline guibg=#1f2f3f")
vim.cmd(":hi ColorColumn ctermbg=black guibg=NvimDarkGray2")
vim.cmd(":hi CursorLine guibg=NvimDarkGray2")

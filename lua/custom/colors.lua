-- COLORS --

vim.cmd("colorscheme vague")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.cmd(":hi statusline guibg=#ac4351")
vim.cmd(":hi ColorColumn guibg=none guifg=none")
vim.cmd(":hi SignColumn guibg=none guifg=none")
vim.cmd(":hi FoldColumn guibg=none guifg=none")
vim.cmd(":hi CursorLine guibg=NvimDarkGray2")

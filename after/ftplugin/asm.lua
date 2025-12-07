vim.g.mapleader = " "
vim.keymap.set('n', '<leader>mkh', function()
	vim.cmd('norm i;*******;')
	vim.cmd('norm i;*******;O')
	vim.cmd('norm i;*** ***;4hi ')
end)

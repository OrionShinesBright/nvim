local map = vim.keymap.set
vim.g.mapleader = " "

vim.keymap.set('i', 'jk', function()
	vim.lsp.completion.enable(true, 1, 0)
	vim.lsp.completion._omnifunc(1, 1)
end)

vim.keymap.set('n', '<leader>pack', function()
	vim.api.nvim_open_win(0,true,{
		style="minimal",
		relative='editor',
		row=3,
		col=80,
		width=80,
		height=30,
	})
	vim.cmd("terminal ~/.config/nvim/extras/packman/packman.sh")
	vim.o.modifiable = true;
	vim.cmd("norm i")
end)

map("n", "<leader>o", ":update<CR>:source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>v", ":e $MYVIMRC<CR>")
map("n", "<leader>z", ":e ~/.config/zsh/.zshrc<CR>")
map("n", "<leader>s", ":e #<CR>")
map("n", "<leader>S", ":sf #<CR>")
-- map({ "n", "v" }, "<leader>c", "1z=")
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>e", ":Drex<CR>")
map("t", "", "")
map("t", "", "")
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>gy", function()
	vim.cmd("Goyo 75%x95%")
	vim.opt_local.cursorline = false
	vim.opt_local.cmdheight = 0
end)
map("n", "<leader>gY", function()
	vim.cmd("Goyo!")
	vim.opt_local.cursorline = true
	vim.cmd(":source $MYVIMRC")
end)
map({ "n", "v" }, "<leader>c", ":center<CR>")
map("n", "<Esc>", ':nohlsearch<CR>')
local ls = require("luasnip")
map("i", "<C-e>", function()
	ls.expand_or_jump(1)
end, { silent = true })
map({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
map({ "i", "s" }, "<C-K>", function()
	ls.jump(-1)
end, { silent = true })
map("n", "Y", "y$", { desc = "Yank to end of line" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
-- Buffer navigation
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

map("n", "j", "gj")
map("n", "k", "gk")

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
-- Better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Quick config editing
vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<leader>rl", ":so $MYVIMRC<CR>", { desc = "Reload config" })
-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Alternative navigation (more intuitive)
vim.keymap.set('n', '<leader>T', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Previous tab' })

-- Tab moving
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' })
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })

map("n", "<leader>ls", function()
	vim.cmd("!ls -a | wl-copy")
	vim.cmd(":put")
end)

map("n", "<leader>P", function()
	vim.cmd("Profile")
end)

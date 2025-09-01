vim.g.mapleader = " "

vim.keymap.set("n", "<leader>Lis", function()
	-- vim.o.rtp:append("lazy.MiniIndentScope__indenthighlights")
	require("custom.lazy.MiniIndentScope__indenthighlights")
	require("notify").notify("Mini Indent-Scope is now running", 'info', {
		title = "Lazy Loading",
		icon = "INFO",
		timeout = "300",
	})
end)

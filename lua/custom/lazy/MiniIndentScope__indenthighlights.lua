require("mini.indentscope").setup({
	draw = {
		delay = 10,
		priority = 2,
	},
	mappings = {
		object_scope = 'ii',
		object_scope_with_border = 'ai',
		goto_top = '[i',
		goto_bottom = ']i',
	},
	options = {
		n_lines = 10000,
	},
	symbol = '╎',
})

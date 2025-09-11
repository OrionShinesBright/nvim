vim.o.matchtime = 1 				-- Show matching brackets
vim.o.showmatch = true 				-- Show matching pairs

vim.o.fillchars = 'eob: ' 			-- Allows replacing normal vim placeholder characters
vim.o.conceallevel = 3 				-- Hide Markdown

vim.o.culopt = 'both' 				-- Number and cursor line highlighting
vim.o.cursorline = true 			-- I know, right?
vim.o.colorcolumn = "120" 			-- That blackish column you see on the right
vim.o.signcolumn = "number" 		-- Shows signs on the left
vim.o.showtabline = 1 				-- Shows tab line above when needed
vim.o.laststatus = 3 				-- Conditions for the last window having a status line

vim.o.pumblend = 10 				-- A bit of native popup transparency (100:transparent, 0:opaque)
vim.o.winborder = "single" 			-- Windows can have borders, yes

vim.o.cmdheight = 1 				-- Height of the command line below the status bar

vim.o.number = true 				-- Line numbers
vim.o.relativenumber = false 		-- Set relative numbers to override numbers

vim.o.statusline =
' 󱥸 [ %Y] 󱥸 [󰈮:%F] 󱥸 %m%r%w%h %=󱥸 [󰴍%l,󰣟%c] 󱥸 [%p%%] 󱥸 [Buf:%n] 󱥸 '

vim.o.guicursor =
"n-v-c:block,i-ci-ve:ver95,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

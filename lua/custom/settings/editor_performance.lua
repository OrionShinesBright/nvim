vim.o.verbose = 0           -- Do not let neovim's rants slow you down

vim.o.lazyredraw = true     -- Don't redraw during macros
vim.o.redrawtime = 10000    -- Amount of time before a thing is redrawn

vim.o.maxmempattern = 20000 -- Max memory to spend while searching for something
vim.o.synmaxcol = 300       -- Syntax highlighting limit

vim.o.updatetime = 30       -- Faster completion

vim.o.termsync = true       -- Terminal redrawing syncing
vim.o.termguicolors = true  -- Terminal colors inherited by nvim

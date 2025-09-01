								-- INDENTING --
vim.o.autoindent = true     -- Indents continuation of line to same level as parent line
vim.o.copyindent = true     -- Copy indentation level from previous line
vim.o.expandtab = false     -- Tabs instead of spaces
vim.o.preserveindent = true -- Exactly what it sounds like
vim.o.shiftround = true     -- Better indentations
vim.o.shiftwidth = 4        -- Indent to 4 levels
vim.o.smartindent = true    -- Yeah
vim.o.smarttab = true       -- Yeah
vim.o.softtabstop = 0       -- We want actual tabs
vim.o.tabstop = 4           -- Fixed tab space

								 -- WRAPPING --
vim.o.wrap = true		  -- Wrap dem lines yo
vim.o.linebreak = true    -- Causes lines to wrap better
vim.o.breakindent = true  -- Lets the wrapped line continuations remain visually indented
vim.o.showbreak = '    ' -- Indentation guide for wrapped lines

								 -- FOLDING --
vim.o.foldenable = true     -- Allows Folding
vim.o.foldcolumn = '1'      -- Shows folds on the left of signcolumn
vim.o.foldclose = ''        -- Allows closing folds upon leaving automatically
vim.o.foldmethod = 'manual' -- Lets the user manage all folds

								-- SEARCHING --
vim.o.hlsearch = true      -- highlighting word upon search
vim.o.ignorecase = true    -- Allows case-insensitive searching/matching
vim.o.inccommand = 'split' -- Shows searches incrementally in a split
vim.o.incsearch = true     -- Enables incremental searching
vim.o.smartcase = true     -- Case smartness while searching
vim.o.wildmenu = true      -- Wildcard menu

							   -- Spell Checks --
vim.o.spell = false          -- Spell Checking
vim.o.spelloptions = 'camel' -- Camel case spell check support

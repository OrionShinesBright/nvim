vim.o.autochdir = false      -- Change working directory to the directory of newly opened file
vim.o.autoread = true        -- Autoread allows reading external changes to a file opened

vim.o.cdhome = true          -- Allows :cd to take you to your home directory
vim.o.exrc = true            -- Allows Project level configuration (see :h 'exrc')

vim.o.fileencoding = 'UTF-8' -- Sets fileencoding to UTF-8 (do NOT change)

vim.o.backup = false         -- Writes backup files and keeps them (yuck)
vim.o.swapfile = false       -- No backup files
vim.o.writebackup = false    -- as above

vim.o.undofile = false       -- Allow for undo file saving
vim.o.undolevels = 200       -- Amount of undos allowed

-- This is my basic setup for neovim that I have ported from an earlier
-- vimscript file.
-- It's time for lua everything.

							
-- map the leader key.
vim.g.mapleader = ','
-- highlight the searched text.
vim.opt.hlsearch = true

-- auto read a file that was changed outside of nvim.
vim.opt.autoread = true

-- auto indent. Is this preventing in the i on tab press.
vim.opt.autoindent = true

-- enable mouse in all modes.
vim.opt.mouse = 'a'

-- configure backspace to behave like normal again.
vim.opt.backspace = '2'

-- line numbers please.
vim.opt.number = true

-- quicksave command ? check the update doc.
vim.keymap.set('n', '<C-Z>', ':update<CR>', { noremap = true })
vim.keymap.set('v', '<C-Z>', '<C-C>:update<CR>', { noremap = true })
vim.keymap.set('i', '<C-Z>', '<C-O>:update<CR>', { noremap = true })

-- shortcuts to save and close buffers.
vim.keymap.set('', '<Leader>e', ':q<CR>', {noremap = true})
vim.keymap.set('', '<Leader>E', ':qa!<CR>', {noremap = true})


-- easily move between vim panes.
vim.keymap.set('', '<C-j>', '<C-w>j')
vim.keymap.set('', '<C-k>', '<C-w>k')
vim.keymap.set('', '<C-h>', '<C-w>h')
vim.keymap.set('', '<C-l>', '<C-w>l')

-- switch tabs
vim.keymap.set('', '<Leader>n', ':tabp<CR>')
vim.keymap.set('', '<Leader>m', ':tabn<CR>')


-- indent blocks easier
vim.keymap.set('v', '<' , '<gv', {noremap = true})
vim.keymap.set('v', '>' , '>gv', {noremap = true})


-- background dark
vim.opt.background = 'dark'

-- misc options
vim.opt.history = 700
vim.opt.undolevels = 700

-- formatting things
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
-- vim.opt.expandtab = true

-- format json
vim.keymap.set('n', '<Leader>J', ':python3 -m json.tool %<CR>')
	
-- some plugins assume filetype enabled. Is it required for neovim ?
vim.cmd [[
	filetype on
	filetype plugin on
]]




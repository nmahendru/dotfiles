-- Add your plugins
--
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

    Plug('junegunn/fzf')
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
		Plug 'neovim/nvim-lspconfig'

vim.call('plug#end')

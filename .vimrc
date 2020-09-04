set hlsearch
syntax on
set autoindent
" Autoread any file that is changed outside of vim
set autoread
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","



" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Remove trailing whitespaces
noremap <c-a> :%s/\s\+$//g<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Showing line numbers and length
set number  " show line numbers
" set w=119   " width of document (used by gd)
" set owrap  " don't automatically wrap on load
" set o-=t   " don't automatically wrap text when typing
set colorcolumn=119
highlight ColorColumn ctermbg=233

set background=dark

" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
" set hlsearch
" set ncsearch
" set gnorecase
" set martcase

" Toggle soft wrap
noremap <Leader>z :set wrap!<CR>
noremap <Leader>j :python3 -m json.tool %<CR>
" These are used by many plugin which selectively enable functionality
filetype on
filetype plugin on

" Settings for ALE plugin https://github.com/dense-analysis/ale
" Settings specific to rust.
"
" The rust analyzer binary was downloaded using:
" curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-mac -o ~/.cargo/bin/rust-analyzer
" more details: https://rust-analyzer.github.io/manual.html#installation

" ale lint
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_filetype_changed = 0

" lint error preview
let g:ale_cursor_detail = 1
let g:ale_hover_to_preview = 1
let g:ale_set_balloons = 0
let g:ale_use_global_executables=1

let g:ale_c_clangformat_executable='clang-format'
let g:ale_c_clangd_executable='clangd'

let g:ale_python_pycodestyle_executable='pycodestyle'
let g:ale_python_pylint_executable='pylint'



let g:ale_rust_rls_executable='/Users/nitin/.cargo/bin/rls'
let g:ale_rust_rls_toolchain='stable'
let g:ale_rust_rls_config={
\   'rust': {
\        'clippy_preference': 'on'
\   }
\ }
let g:ale_rust_analyzer_config={
\   'rust': {
\        'clippy_preference': 'on'
\   }
\ }

let g:ale_rust_analyzer_executable='/Users/nitin/.cargo/bin/rust-analyzer'
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_clippy_options = ' -D warnings '
let g:ale_linters={
\    'rust': ['analyzer'],
\    'python': ['pylint', 'pycodestyle', 'pyls'],
\    'c': ['clangd']
\}

"
let g:ale_completion_enabled = 1
let g:ale_python_pycodestyle_options="--max-line-lngth=120 --exclude='prot,__pycache__,*pb2*,build' --format='PEP8: %(path)s@%(row)d,%(col)d [%(code)s] %(text)s'"
let g:ale_python_pylint_options='--rcfile ~/pylint.cfg --reports=n --jobs=2 --score=n --disable=I --disable=fixme --ignore-patterns=".*_pb2(_grpc)?.py$" '

let g:ale_c_clangd_options=" --background-index --completion-style=detailed --header-insertion=iwyu -j 3"
let g:ale_fixers={
\   'rust': ['rustfmt'],
\   'python': ['isort', 'black'],
\   'c': [ 'clang-format'],
\}

" disable the red color for error highlights. hard to read the text under red
" highlights.
let g:ale_set_highlights = 0

autocmd FileType rust noremap <Leader>r :ALEFindReferences<CR>
autocmd FileType python noremap <Leader>r :ALEFindReferences<CR>
autocmd FileType c noremap <Leader>r :ALEFindReferences<CR>

autocmd FileType rust noremap <Leader>d :ALEHover<CR>
autocmd FileType python noremap <Leader>d :ALEHover<CR>
autocmd FileType c noremap <Leader>d :ALEHover<CR>


" easily cycle through lint errors.
autocmd FileType rust noremap <Leader>l :ALENext<CR>
autocmd FileType python noremap <Leader>l :ALENext<CR>
autocmd FileType c noremap <Leader>l :ALENext<CR>

" open the autocomplete menu using racer.
autocmd FileType rust inoremap <Leader>v <C-x><C-o>

" ALE completion too eager fix
" https://github.com/dense-analysis/ale/issues/1700
autocmd FileType rust setlocal completeopt=menu,menuone,preview,noselect,noinsert
autocmd FileType python setlocal completeopt=menu,menuone,preview,noselect,noinsert
autocmd FileType c setlocal completeopt=menu,menuone,preview,noselect,noinsert


" Setting for rust plugin https://github.com/rust-lang/rust.vim
let g:rustfmt_autosave=1
let g:rustfmt_options=''

" Settings for fzf vim
" https://github.com/junegunn/fzf.vim
set rtp+=/usr/local/bin/fzf

" Setting for vim-fugitive - git plugin
" git@github.com:tpope/vim-fugitive.git
"
"
" Settings for vim racer. For now trying ALE completion
let g:racer_experimental_completer=1
let g:racer_insert_paren=1

" autocmd FileType rust nmap <buffer> gd  :ALEGoToDefinition<CR>
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END


" Settings for TagBar
noremap <Leader>x :TagbarToggle<CR>

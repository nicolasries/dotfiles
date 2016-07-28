" Plugins {{{

" Install {{{

" vim plug
call plug#begin('~/.config/nvim/plugged')

" File tree
" Plug 'scrooloose/nerdtree'
" Git Symbols in nerdtree
" Plug 'Xuyuanp/nerdtree-git-plugin'

" automatic folds and position restore
" Plug 'vim-scripts/restore_view.vim'

" Syntax checking
Plug 'benekastah/neomake'

" easily change/delete surrounding quotes and tags
Plug 'tpope/vim-surround'

" repeat plugin commands
Plug 'tpope/vim-repeat'

" abbreviation, substitution, coercion
Plug 'tpope/vim-abolish'

" commenting
Plug 'tpope/vim-commentary'

" fuzzy file matching
" Plug 'junegunn/fzf.vim'

"Plug 'bronson/vim-trailing-whitespace'
"Plugin 'ap/vim-css-color'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'scrooloose/syntastic.git'
"Plugin 'Raimondi/delimitMate'
"Plugin 'docunext/closetag.vim'
"Plugin 'ervandew/supertab'
"Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'

" Autocompletion {
Plug 'Shougo/deoplete.nvim'

" deoplete include support
" Plug 'Shougo/neoinclude.vim'
" let g:neoinclude#ctags_commands = {"_" : "~/bin/ctags"}

" vimscript Deoplete source
Plug 'Shougo/neco-vim'

" Deoplete Python
Plug 'zchee/deoplete-jedi'

" PHP
" Plug 'shawncplus/phpcomplete.vim'
" let g:phpcomplete_parse_docblock_comments = 1

" snippets
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

" autcompletion in buffers w/ different filetypes
" Plug 'Shougo/context_filetype.vim'
" if !exists('g:context_filetype#same_filetypes')
"     let g:context_filetype#same_filetypes = {}
" endif
" let g:context_filetype#same_filetypes.css = 'html'

" Go Deoplete source
" Plug 'zchee/deoplete-go', {'do': 'make'}
" Go autocomplete daemon
" Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" }

" Git Wrapper Methods
Plug 'tpope/vim-fugitive'

" Git symbols in the sign column
Plug 'airblade/vim-gitgutter'

" status bar
" Plug 'vim-airline/vim-airline'
" disable standard status bar
" set noshowmode


" html/css abbreviations
" Plug 'mattn/emmet-vim'

"color schemes
" Plug 'flazz/vim-colorschemes'
" Plug 'samuel-phillips/nvim-colors-solarized'
" Plug 'tomasr/molokai'
" Plug 'sickill/vim-monokai'
" Plug 'morhetz/gruvbox'
Plug 'fcevado/molokai_dark'

" PHP
" Plug 'StanAngeloff/php.vim'

" Unicode character metadata
Plug 'tpope/vim-characterize'

call plug#end()

" }}}

" Config {{{

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 200
let g:deoplete#max_menu_width = 200

" }}}

" }}}

" Keybindings {{{

" no selection loss after visual indenting
vnoremap > >gv
vnoremap < <gv

" }}}

" UI {{{

" syntax highlighting
syntax enable

" folding
set foldmethod=syntax
au FileType vim,conf,zsh
            \ setlocal foldmethod=marker | 
            \ set foldmarker={{{,}}}

" Colors and stuff

" 24 bit colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colo molokai_dark
" set background=dark

" set Unix as standard filetype
set ffs=unix,dos,mac

" disable mouse
set mouse=

" no annoying swap files
set noswapfile

" display line numbers
set relativenumber number

" indent based on current file
filetype indent plugin on
filetype plugin on

" " Remember cursor position between vim sessions
" autocmd BufReadPost *
"               \ if line("'\"") > 0 && line ("'\"") <= line("$") |
"               \   exe "normal! g'\"" |
"               \ endif
" " center buffer around cursor when opening files
" autocmd BufRead * normal zz

" " }}}

" Text editing {{{

" Spaces instead of Tabs
set expandtab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set autoindent "always autoindent
set history=1000 "remember more stuff
set undolevels=1000

"highlight entire search word
set hlsearch

" incremental searching
set incsearch

" always show status line
set laststatus=2

" show entered commands
set showcmd

" }}}


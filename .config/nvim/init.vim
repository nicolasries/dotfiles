" Plugins {{{

" vim plug
call plug#begin('~/.config/nvim/plugged')

" Syntax checking
Plug 'benekastah/neomake'

" easily change/delete surrounding quotes and tags
Plug 'tpope/vim-surround'

" repeat plugin commands
Plug 'tpope/vim-repeat'

" commenting
Plug 'tpope/vim-commentary'

" auto completion
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 200
let g:deoplete#max_menu_width = 200

" vimscript Deoplete source
Plug 'Shougo/neco-vim'

" color scheme
Plug 'fcevado/molokai_dark'

call plug#end()

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
set foldmethod=marker
set foldmarker={{{,}}}

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


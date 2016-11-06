"   ____ ____ ____ ____ ____ ____ ____ 
"  ||J |||a |||r |||v |||i |||s'|||s ||
"  ||__|||__|||__|||__|||__|||__|||__||
"  |/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
"           NeoVim init.vim
"
"  Author: Jarvis Prestidge
"  Link  : https://github.com/jarvisprestidge/dotfiles
"

" Turn off compatiblity support for vi
if &compatible
        set nocompatible
endif

" =====================================
"                   Plugins
" =====================================

" Include plugins
source ~/.config/nvim/plugins.vim

" =====================================
"             General Configuration
" =====================================

" Necessary for dein
filetype plugin indent on
syntax enable

" Guard to safely re-source init.vim
if !exists('g:encoding_set') || !has('nvim')
    set encoding=utf8
    let g:encoding_set = 1
endif

" after a re-source, fix syntax matching issues
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Let vim use the system clipboard
set clipboard^=unnamedplus,unnamed

" Don't protect against data loss
set noswapfile
set nobackup

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/undo/

" Maintain hidden buffers
set hidden

filetype on

set history=1000

" make backspace sane
set backspace=indent,eol,start

" Wrapping
set textwidth=79
set wrap                    " turn on line wrapping
set wrapmargin=5            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

" Indenting
set autoindent              " automatically set indent of new line
set smartindent

" Tabs and spaces
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'

" Misc.
set ttyfast                 " faster redrawing
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros
set magic

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" No error bells
set noerrorbells
set visualbell

" =====================================
"                    Theme
" =====================================

" Enable 24 bit color support if supported
if (has("termguicolors"))
        set termguicolors
endif

" Color scheme settings
colorscheme gruvbox
set background=dark


" =====================================
"                  Interface
" =====================================

set number

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" replace the default box drawing characters
set fillchars=vert:│,fold:─,diff:─

" =====================================
"                   Mappings
" =====================================

" Space as leader
let mapleader = ' '

" Move around viewports
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l

" Handy remap to get out of insert mode
inoremap jk <Esc>

" Remove search highlighting
nnoremap <silent> jk :noh<cr>

" Remove search highlighting
cnoremap <silent> jk <Esc>

" Toggle list symbols
nnoremap <silent> <leader>l :set list!<cr>

" Toggle relative numbers
nnoremap <silent> <leader>n :set relativenumber!<cr>

" Make Y move like D and C
noremap Y y$

" Quickly edit init.vim
nnoremap <silent> <leader>ev :e ~/.config/nvim/init.vim<cr>

" Source init.vim
nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim<cr>

" Quickly edit plugins
nnoremap <silent> <leader>ep :e ~/.config/nvim/plugins.vim<cr>

" Scroll viewport
nnoremap <PageUp> 5<C-y>
nnoremap <PageDown> 5<C-e>
inoremap <PageUp> <Esc>5<C-y>
inoremap <PageDown> <Esc>5<C-e>

" Re-highlight indented selection
vnoremap < <gv
vnoremap > >gv

" Improve up and down movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Keep search pattern at center of screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" Search for word under cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" =====================================
"               Plugin: NERDTree
" =====================================

" Toggle NerdTree
nnoremap <silent> <leader>k :NERDTreeToggle<cr>

" Show hidden files
let NERDTreeShowHidden = 1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''

" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

hi Directory guifg=#689d6a

" Close if only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =====================================
"               Plugin: Devicons
" =====================================


" =====================================
"               Plugin: Fugitive
" =====================================

" git status
nnoremap <leader>gs :Gstatus<cr>

" git add .
nnoremap <leader>ga :Git add .<cr><cr>

" git commit -v -q - verbose and quiet
nnoremap <leader>gc :Gcommit -v -q<cr>

" git log - opens in quickfix windows to navigate to commits
nnoremap <silent> <leader>gl :silent! Glog<cr>:bot copen<cr>


" =====================================
"                Plugin: Tagbar
" =====================================

" Toggle Tagbar
nnoremap <silent> <leader>t :TagbarToggle<CR>

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" =====================================
"               Plugin: Airline
" =====================================

let g:airline_theme='gruvbox'

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2 
let g:airline#extensions#tabline#show_buffers = 0 
let g:airline#extensions#tabline#show_splits = 0

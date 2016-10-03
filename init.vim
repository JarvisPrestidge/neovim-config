"   ____ ____ ____ ____ ____ ____ ____ 
"  ||J |||a |||r |||v |||i |||s'|||s ||
"  ||__|||__|||__|||__|||__|||__|||__||
"  |/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
"	    NeoVim init.vim
"
"  Author: Jarvis Prestidge
"  Link  : https://github.com/jarvisprestidge/dotfiles
"

" Turn off compatiblity support for vi
if &compatible
	set nocompatible
endif

" =====================================
"	            Plugins
" =====================================

" Include plugins
source ~/.config/nvim/plugins.vim

" =====================================
"	      General Configuration
" =====================================

" Necessary for dein
filetype plugin indent on
syntax enable

" Don't protect against data loss
set noswapfile
set nobackup

" Maintain hidden buffers
set hidden

filetype on

set history=1000

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
"	             Theme
" =====================================

" Enable 24 bit color support if supported
if (has("termguicolors"))
	set termguicolors
endif

" Color scheme settings
colorscheme gruvbox
set background=dark


" =====================================
"	           Interface
" =====================================

set number

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" =====================================
"	            Mappings
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

" Toggle list symbols
nnoremap <silent> <leader>l :set list!<cr>

" Quickly edit / source the vimrc file
nnoremap <silent> <leader>ev :e ~/.config/nvim/init.vim<cr>

nnoremap <silent> <leader>sv :so ~/.config/nvim/init.vim<cr>

" Scroll viewport
nnoremap <PageUp> 5<C-e>
nnoremap <PageDown> 5<C-y>


" =====================================
"	        Plugin: NERDTree
" =====================================

" Toggle NerdTree
nnoremap <silent> <leader>k :NERDTreeToggle<cr>

" =====================================
"	        Plugin: Fugitive
" =====================================

" git status
nnoremap <silent> <leader>gs :Gstatus<cr>

" =====================================
"	         Plugin: Tagbar
" =====================================

" Toggle Tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" =====================================
"	        Plugin: Airline
" =====================================

let g:airline_theme='gruvbox'

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2 
let g:airline#extensions#tabline#show_buffers = 0 
let g:airline#extensions#tabline#show_splits = 0


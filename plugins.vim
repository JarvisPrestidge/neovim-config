"   ____ ____ ____ ____ ____ ____ ____ 
"  ||J |||a |||r |||v |||i |||s'|||s ||
"  ||__|||__|||__|||__|||__|||__|||__||
"  |/__\|/__\|/__\|/__\|/__\|/__\|/__\|
"
"	      NeoVim plugins.vim
"
"  Author: Jarvis Prestidge
"  Link  : https://github.com/jarvisprestidge/dotfiles
"

" =====================================
"	        Plugins
" =====================================

" Add dein to runtime path
set runtimepath+=~/.vim/plugins/repos/github.com/Shougo/dein.vim

" Start plugin block
call dein#begin(expand('~/.vim/plugins'))

" Plugin Manager
call dein#add('Shougo/dein.vim')

" Theme
call dein#add('morhetz/gruvbox')

" Fancy icons
call dein#add('ryanoasis/vim-devicons')

" Status bar
call dein#add('vim-airline/vim-airline')

" File broswer
call dein#add('scrooloose/nerdtree')

" Tag / class broswer
call dein#add('majutsushi/tagbar')

" Git Integration
call dein#add('tpope/vim-fugitive')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('airblade/vim-gitgutter')

" Linting & syntax highlighting
" 	neomake

" Code completion
" 	deoplete.nvim
" 	clang-complete
" 	jedi
call dein#add('ervandew/supertab')
call dein#add('jiangmiao/auto-pairs')

" Movement & motions
call dein#add('tpope/vim-surround')
call dein#add('easymotion/vim-easymotion')

" Alignment & formatting 
call dein#add('godlygeek/tabular')

" Comments
call dein#add('tpope/vim-commentary')


if dein#check_install()
	call dein#install()
endif

" End plugin block
call dein#end()
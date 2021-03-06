" Vim-plug
call plug#begin('$XDG_CONFIG_HOME/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'javascript'}
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/gruvbox-material'
call plug#end()

" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.2

set nocompatible

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
	set scrolloff=1
endif
if !&sidescrolloff
	set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'eol:$'
	set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
	setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'ifsh$' && (v:version < 704 || v:version == 704 && !has('patch276'))
	set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
	set history=1000
endif

if &tabpagemax < 50
	set tabpagemax=50
endif
if !empty(&viminfo)
	set viminfo^=!
endif
set sessionoptions-=options
set viewoptions-=options

" Allow color schemes to do bright colors without forcing bold
if &t_Co == 8 && $TERM !~# '^Eterm'
	set t_Co=16
endif

" Load matchinit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

if empty(mapcheck('<C-U>', 'i'))
	inoremap <C-U> <C-G>u<C-U>
endif
if empty(mapcheck('<C-W>', 'i'))
	inoremap <C-W> <C-G>u<C-W>
endif

" vim:set ft=vim et sw=2:

" Ugh, ex-mode. Bleurgh.
nnoremap Q <Nop>

" Search case sensitivity (If search is purely lowercase, it'll search case
" insensitively. If search contains uppercase characters, it'll search case
" sensitively.)
set ignorecase
set smartcase
colorscheme gruvbox-material
"highlight Normal ctermbg=none guibg=none

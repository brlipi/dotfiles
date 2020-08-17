" Plugins
	call plug#begin('~/.vim/plugged')
        Plug 'jremmen/vim-ripgrep'
        Plug 'tpope/vim-fugitive'
        Plug 'vim-utils/vim-man'
        Plug 'lyuts/vim-rtags'
        Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
        Plug 'https://github.com/ycm-core/YouCompleteMe.git'
        Plug 'mbbill/undotree'
        Plug 'ap/vim-css-color'
	call plug#end()

" General Settings
	syntax enable
	set number relativenumber
	set tabstop=4 softtabstop=4
	set shiftwidth=4
	set expandtab
"	set nowrap
"	set smartcase 
"	set noswapfile
	set nobackup
	set undodir=~/.vim/undodir
	set undofile
    set incsearch
    set laststatus=2

" Colorscheme
    colorscheme elflord
"    set background=dark
    hi Normal guibg=NONE ctermbg=NONE

" Autocompletion
	set wildmode=longest,list,full

" Disable automatic comment on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    if executable('rg')
        let g:rg_derive_root='true'
    endif

    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    let mapleader = " "
    let g:netrw_browse_split = 2
    let g:netrw_banner = 0
    let g:ctrlp_use_caching = 0
    let g:netrw_winsize = 25
    let g:netrw_altv=1

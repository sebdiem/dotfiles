" Vundle configuration
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
Plugin 'tpope/vim-fugitive'
Plugin 'vim-pandoc/vim-pantondoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'junegunn/goyo.vim'
Plugin 'vim-scripts/LanguageTool'

call vundle#end()
filetype plugin indent on
" End of Vundle configuration

""""""""""""""""""""Theme""""""""""""""""""""
" Enable syntax highlighting
syntax enable
" Set 256 color terminal support
set t_Co=256
" Set dark background
set background=dark
" Set colorscheme
silent! colorscheme jellybeans

""""""""""""""""""""Backups""""""""""""""""""""
" do not keep backups after close
set nobackup
" do not keep a backup while working
set nowritebackup
" don't keep swp files either
set noswapfile
" store backups under ~/.vim/backup
set backupdir=~/.vim/backup
" keep attributes of original file
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
" keep swp files under ~/.vim/swap
set directory=~/.vim/swap,~/tmp,

""""""""""""""""""""Filetype & encoding""""""""""""""""""""
" utf-8
set encoding=utf-8

augroup vimrcEx
  autocmd!
  " Define filetype markdown for .md files
  " Note that filetype configurations are defined in .vim/ftpplugins folder
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

""""""""""""""""""""UI""""""""""""""""""""
" Current line and column
set ruler 
" Show lines
set number
" start scrolling before cursor at end
set scrolloff=3
" don't display incomplete commands
set noshowcmd
" line wrap
set wrap lbr
" incremental searching
set incsearch
" Highlight search
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" If a file is changed outside of vim, automatically reload it without asking
set autoread
" Shut the fuck up
set vb t_vb=

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
" manage tabs
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Mac vim
set guifont=Monaco:h12

""""""""""""""""""""Mappings""""""""""""""""""""
let maplocalleader = "\<space>"

" handle line wrap correctly
noremap j gj
noremap k gk

" fast escape
set timeoutlen=400
imap jj <ESC>
vmap <Space> <ESC>
cmap jj <ESC>

" easier $
nnoremap ù $
vnoremap ù $

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Press Double Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <LocalLeader><LocalLeader> :nohlsearch<Bar>:echo<CR>

" copy to system clipboard
vmap <LocalLeader>c "+y

" paste in NORMAL mode from system clipboard (at or after cursor)
nmap <LocalLeader>V "+gP
nmap <LocalLeader>v "+gp

" Save, quit, edit easily:
nmap <LocalLeader>s :wa!<cr>
nmap <LocalLeader>q :q!<cr>
nmap <LocalLeader>e :vsp 

""""""""""""""""""""Plugins configuration""""""""""""""""""""
" Language tool
let g:languagetool_jar='/usr/local/cellar/languagetool/2.4.1/libexec/languagetool-commandline.jar'
" Vundle configuration
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Plugins
Plugin 'godlygeek/tabular'
Plugin 'Raimondi/delimitMate'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sebdiem/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pantondoc'
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
scriptencoding utf-8
set encoding=utf-8

augroup vimrcEx
  autocmd!
  " Define filetype markdown for .md files
  " Note that filetype configurations are defined in .vim/ftpplugins folder
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

""""""""""""""""""""UI""""""""""""""""""""
" Split right:
set splitright
" Always a status line:
set laststatus=2
" Allow hidden buffer without screaming
set hidden
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
" Show column
set colorcolumn=120

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
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

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

" add python breakpoint
nmap <LocalLeader>b Oimport ipdb; ipdb.set_trace()<ESC>

" Tags and search
set tags=./tags;
nmap <LocalLeader>t <C-]>
nmap <LocalLeader>f *:Ack <c-r>=expand("<cword>")<cr><cr>

" view current arg:
nnoremap <Return> :argument<cr>
nmap <LocalLeader>aa <Plug>AirlineAddArg
nmap <LocalLeader>ad <Plug>AirlineDeleteArg

" Expand %%/ to current file directory:
cabbr <expr> %% expand('%:p:h')

" reset path:
nmap <LocalLeader>p :exe 'set path='.getcwd().'/**'<cr>:set path<cr>

" For unimpaired.vim
nmap ( [
omap ( [
xmap ( [
nmap ) ]
omap ) ]
xmap ) ]

" Parenthesis
imap <C-l> <S-Tab>

" Edit in next window
command! -nargs=1 -complete=file E :wincmd w | :e <args>
command! -nargs=1 -complete=buffer B :wincmd w | :b <args>

""""""""""""""""""""Plugins configuration""""""""""""""""""""
" Language tool
let g:languagetool_jar='/usr/local/cellar/languagetool/2.4.1/libexec/languagetool-commandline.jar'

" Vim-airline
let g:airline#extensions#tabline#enabled = 1

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=/Users/Seb/.pylintrc'

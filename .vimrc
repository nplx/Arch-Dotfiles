set nocompatible
set hidden
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ignorecase  " ignore case when searching
syntax on
colorscheme wuye
"colorscheme inkpot
call pathogen#infect()
filetype plugin indent on
"set pastetoggle=<F2>
set guioptions-=T
set number
set tabstop=4
set shiftwidth=4
set visualbell
set noerrorbells
set list
set encoding=utf-8
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ch=2
set laststatus=2
set guifont=YaHei\ Consolas\ Hybrid\ 10
let g:Powerline_symbols ='fancy'
set t_Co=256
au BufRead /tmp/mutt-* set tw=72

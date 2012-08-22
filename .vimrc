set nocompatible
set hidden
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ignorecase  " ignore case when searching
syntax on
colorscheme wuye
call pathogen#infect()
filetype plugin indent on
set pastetoggle=<F2>
set guioptions-=T
set number
set tabstop=4
set shiftwidth=4
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ch=2
set laststatus=2
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
let Powerline_symbols = 'fancy'
au BufRead /tmp/mutt-* set tw=72

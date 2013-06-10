set nocompatible
set hidden
set autoindent
" set smartindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set ignorecase  " ignore case when searching
syntax on
" colorscheme molokai
" colorscheme dw_green
colorscheme ekvoli
call pathogen#infect()
filetype plugin indent on
set guioptions-=T
" set expandtab
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
au BufRead /tmp/mutt-* set tw=70
set wildmenu
set wildmode=list:longest,full
set mouse=a
"""""""" autocomplete brackets
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap < <><Left>
"""""""" autocomplete quotes
inoremap ' '<Esc>:call QuoteInsertionWrapper("'")<CR>a
inoremap " "<Esc>:call QuoteInsertionWrapper('"')<CR>a
inoremap ` `<Esc>:call QuoteInsertionWrapper("`")<CR>a
function! QuoteInsertionWrapper (quote)
	let col = col('.')
	if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
		normal ax
		exe "normal r".a:quote."h"
	end
endfunction

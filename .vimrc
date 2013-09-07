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
"""""""" Airline
" let g:airline_powerline_fonts = 1
" function! AirlineInit()
" 	let g:airline_section_a = airline#section#create(['mode',' ','branch'])
" 	let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
" 	let g:airline_section_c = airline#section#create(['filetype'])
" 	let g:airline_section_x = airline#section#create(['%P'])
" 	let g:airline_section_y = airline#section#create(['%B'])
" 	let g:airline_section_z = airline#section#create_right(['%l','%c'])
" endfunction
" autocmd VimEnter * call AirlineInit()
" markdown disable folding
let g:vim_markdown_folding_disabled = 1
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

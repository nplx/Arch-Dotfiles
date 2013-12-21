"""""""" basic setup
set encoding=utf-8
set nocompatible
set hidden
set autoindent
" set smartindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" set ignorecase  " ignore case when searching
" au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved

"""""""" load pathogen
call pathogen#infect()
filetype plugin indent on

"""""""" gui
syntax on
set guioptions-=T
" colorscheme vj
" colorscheme sift
colorscheme inkpot

"""""""" more basics
set number
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set visualbell
set noerrorbells
set list
nmap <leader>l :set list!<CR>
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:◃
" set listchars=eol:◃,tab:>.,extends:#,nbsp:.
highlight NonText guifg=#444444
set ch=2
set laststatus=2
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

"""""""" better indetation
vnoremap < <gv
vnoremap > >gv
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#444444'
let g:indentLine_char = '┆'

"""""""" NERDTree key rebind
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"""""""" markdown disable folding
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

"""""""" jedi-vim
" let g:jedi#auto_initialization = 0  "disable auto start


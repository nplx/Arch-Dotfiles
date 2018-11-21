"""""""" load pathogen
" call pathogen#infect()
" filetype plugin indent on

"""""""" load Vundle
set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'
" Plugin 'w0rp/ale'
" Plugin 'junegunn/vim-easy-align'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Yggdroot/indentLine'
" Plugin 'sjl/gundo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'

" Rust-lang support
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""" basic setup
" nnoremap : ; " swap : and ;
set encoding=utf-8
set hidden
set number
set autoindent
set backspace=indent,eol,start " allow backspacing over everything in insert mode
" au BufWritePost .vimrc so ~/.vimrc " automatically reload vimrc when it's saved
" set ambiwidth=double " fix unicode special characters width
set hlsearch
nnoremap <C-h> :noh<CR> " turn off search highlight
" nnoremap <silent> <Esc> :noh<CR> " turn off search highlight
" set incsearch
set ignorecase
" set smartcase
let g:conceallevel=0
" autocmd Filetype * setlocal conceallevel=0 " set conceallevel=0
" augroup jsonshow
"     au!
"     au FileType json set conceallevel=0
"     au FileType json let g:json_conceal="adgms"
"     au FileType json hi Conceal guibg=White guifg=DarkMagenta
" augroup END
"""""""" neovim specific
if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    tnoremap <Esc> <C-\><C-n> " nvim terminal <Esc> escape
endif

"""""""" gui
syntax on
set guioptions-=T
if ("gui_running")==0
    " colorscheme iceberg
    " colorscheme Tomorrow-Night-Bright
    colorscheme heroku-terminal
endif
set cursorline
hi Normal ctermbg=None
hi ColorColumn ctermbg=233
hi CursorLine ctermbg=233
hi CursorColumn ctermbg=233
hi LineNr ctermbg=233 ctermfg=240
hi CursorLineNr ctermbg=233 ctermfg=39
hi Visual ctermbg=227 ctermfg=16
hi SpellBad ctermfg=229 ctermbg=166
hi SpellCap ctermfg=229 ctermbg=166
hi SpecialKey ctermfg=238
set fillchars=""
hi VertSplit cterm=None gui=None

hi ExtraWhitespace ctermbg=grey guibg=grey
"""""""" more basics
" set omnifunc=syntaxcomplete#Complete " set omnifunc
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=0   " numberof spaces in tab when editing
set shiftwidth=4
" set smarttab
nnoremap <space> za " space open/close folds
set novisualbell
set noerrorbells
nmap <leader>; :bnext<CR>
nmap <leader>' :bprevious<CR>
set list " show invisible stuff
nmap <leader>l :set list!<CR>
set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:◃
" set listchars=tab:>.,trail:.,extends:#,nbsp:.,eol:⤶
highlight NonText guifg=#444444
set ch=1 " cmdheight
set laststatus=2 " last window always have a status line
" let g:Powerline_symbols ='fancy'
set t_Co=256
set wildmenu
set wildmode=list:longest,full
set mouse=a
set tw=72 fo=cq wm=0 " No automatic wrapping, rewrapping will wrap to 72
set cc=+1 " color the next column after wrap line
" nnoremap gV `[v`] " highlight last inserted text

"""""""" Indent base on file type
autocmd BufRead /tmp/mutt-* setlocal tw=70 fo=cqt
autocmd BufRead *.txt setlocal tw=0 fo+=l wm=5
autocmd Filetype markdown setlocal tw=0 fo+=l wm=5
autocmd Filetype c,cpp,h setlocal noexpandtab ts=8 sts=8 sw=8 tw=100
autocmd Filetype html,xhtml,xml,css,javascript setlocal ts=2 sts=2 sw=2 tw=0
autocmd Filetype ruby setlocal noexpandtab ts=4 sts=4 sw=4
autocmd Filetype python setlocal et ts=4 sts=4 sw=4

"""""""" Key mapping base on file type
autocmd Filetype python nnoremap <buffer> <F9> :exec 'w !python -'<CR>
autocmd Filetype javascript nnoremap <buffer> <F9> :exec 'w !node'<CR>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>
"""""""" Airline
if ("gui_running")==0
    let g:airline_theme = 'murmur'
endif
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline_section_error = ''
" Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_section_a = airline#section#create(['mode',' ','branch'])
" let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
" let g:airline_section_c = airline#section#create(['filetype'])

" let g:airline_section_d = airline#section#create(['filetype'])

" let g:airline_section_x = airline#section#create(['%P'])
" let g:airline_section_y = airline#section#create(['%B'])
" let g:airline_section_z = airline#section#create_right(['%l','%c'])
" let g:airline_section_z = airline#section#create_right(['%{ALEGetStatusLine()}'])


"""""""" better indetation
vnoremap < <gv
vnoremap > >gv
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#444444'
let g:indentLine_char = '┆'

"""""""" Easy align
" xmap ga <Plug>(EasyAlign)
"""""""" CtrlP settings
" let g:ctrlp_max_files         = 0
" let g:NERDTreeChDirMode       = 2
" let g:ctrlp_working_path_mode = 'cr'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" if executable('ag')
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif
"""""""" NERDTree key rebind
nmap <leader>p :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"""""""" markdown disable folding
let g:vim_markdown_folding_disabled = 1

"""""""" autocomplete brackets
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
" inoremap < <><Left>

"""""""" autocomplete quotes
" inoremap ' '<Esc>:call QuoteInsertionWrapper("'")<CR>a
" inoremap " "<Esc>:call QuoteInsertionWrapper('"')<CR>a
" inoremap ` `<Esc>:call QuoteInsertionWrapper("`")<CR>a
" function! QuoteInsertionWrapper (quote)
"     let col = col('.')
"     if getline('.')[col-2] !~ '\k' && getline('.')[col] !~ '\k'
"         normal ax
"         exe "normal r".a:quote."h"
"     end
" endfunction

"""""""" Syntastic
" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" let g:syntastic_stl_format = '[%E{E:%e(#%fe)}%B{,}%W{W:%w(#%fw)}]'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""" Ale
" let g:ale_sign_column_always = 1
" let g:ale_sign_error = '×'
" let g:ale_sign_warning = '!'
" let g:ale_statusline_format = ['✗ %d', '⚠ %d', '✓ ok']

"""""""" YCM
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" let g:ycm_server_keep_logfiles = 1
" let g:ycm_server_use_vim_stdout = 1
" let g:ycm_server_log_level = 'debug'
" let g:ycm_auto_trigger = 1
let g:ycm_python_binary_path = 'python'
" let g:ycm_server_python_interpreter = '/usr/bin/python2.7'
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"""""""" Ultisnip bind key
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/snippets"
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-n>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"""""""" jedi-vim
" let g:jedi#auto_initialization = 0  "disable auto start
" let g:jedi#use_splits_not_buffers = "left"
" let g:jedi#completions_enabled = 0
set splitbelow " show preview pane at bottom

"""""""" Gundo
" let g:gundo_width = 45
" let g:gundo_preview_height = 15
" let g:gundo_right = 1

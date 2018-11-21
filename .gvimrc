" au BufWritePost .gvimrc so ~/.gvimrc " automatically reload vimrc when it's saved
" winpos 42 78
set lines=42
" set columns=132 " YaHei
set columns=98 " Source Code
" set columns=
" set guifont=Source\ Code\ Pro\ for\ Powerline\ 10
" set guifont=YaHei\ Consolas\ Hybrid\ 10
" set guifont=DejaVu\ Sans\ Mono\ 10
" set guifont=Envy\ Code\ R\ for\ Powerline\ 10
" set guifont=Monaco\ 10
set guifont=Input\ Mono\ Regular\ 10
" colorscheme molokai
" colorscheme sea
" colorscheme solarized
" colorscheme Tomorrow-Night
if strftime("%H") < 19 && strftime("%H") >= 7
    " colorscheme lucius
    colorscheme OceanicNext
    " colorscheme PaperColor
    " colorscheme base16-ateliercave
    set background=light
else
    colorscheme onedark
endif
" colorscheme mod8
" colorscheme PaperColor
" set background=light
" colorscheme hybrid-light
" AirlineTheme base16
AirlineTheme lucius
" AirlineTheme zenburn
" AirlineTheme solarized
" AirlineTheme jellybeans
" hi CursorLineNr guifg=#ccc

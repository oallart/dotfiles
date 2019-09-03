set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
"set title           " Displays title in term bar
set spelllang=en_au
autocmd FileType gitcommit setlocal spell
" listchars highlight, symbols and shortcuts
"set listchars=tab:»\ ,trail:·,eol:↲,nbsp:␣
set listchars=tab:»\ ,eol:↲,nbsp:␣
hi NonText ctermfg=DarkGray
"nnoremap ,L :set nolist<CR>
"nnoremap ,l :set list<CR>
"nnoremap ,l :setlocal list!<CR>
nnoremap ,l :windo set list!<CR>
"lost whitespace before end
hi YouForgot ctermbg=Red
match YouForgot / $/
"Numbering of lines with toggling
nnoremap ,n :windo set nu!<CR>
"Min height window when collapsed
set winminheight=0
"C-W remaps to make it faster - moves and expands to window up/down
"all clutched by , for now
nnoremap ,- <C-w>_
map - <C-w>_
nnoremap ,= <C-w>=
map = <C-w>=
nnoremap ,d <C-w>j<C-w>_
nnoremap ,<Down> <C-w>j<C-w>_
nnoremap ,u <C-w>k<C-w>_
nnoremap ,<Up> <C-w>k<C-w>_
map <tab> <c-w>j<C-w>_
map <s-tab> <c-w>k<C-w>_
"#################### experimental ####################
"set guifont=Lucida\ Console:h9 "not in linux/vim
set viminfo='100,s10,h
set nowrap       "avoid breaking lines
set linebreak
set nohlsearch   "avoid automatic search highlighting
set ignorecase   "as name implies, useful for searches
set showcmd      " show (partial) command in status line
set ruler        " show the line and column numbers of the cursor
set list         "? dunno
set noerrorbells "quiet
map ) :bnext<cr>      "buffer navigation - Todo: learn more on buffers
map ( :bprevious<cr>  ")
"status line
"set statusline=%F\ %2*[A:\%4.3b]%*\ %2*[H:\%02.2B]%*\ %4*(%4l,%4v)%*\ %6*%3p%%\ \ of\ %4L\ lines%*\ %1*%3m%4r%6h%*
set statusline=
                        \%-50.50F
                        \\ \|\ %2*Format%*\ %{&ff}
                        \\ \|\ %2*Type%*\ %-6.6Y
                        \\ \|\ %1*ASC%*\ \%4.3b
                        \\ \|\ %1*HEX%*\ \%02.2B
                        \\ \|\ %4*X%*\ %4v
                        \\ \|\ %4*Y%*\ %4l
                        \\ \|\ %6*%3p%%\ \ of\ %4L\ lines%*
                        \\ %1*%3m%4r%6h%*
                        " show syntax info
                        "\\ \|\ %{synIDattr(synID(line('.'),col('.'),0),'name')}

"Todo: further refinements in the status bar, info and colors.

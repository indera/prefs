" @File              : .vimrc for asura

set nu               " Set line numbering
set nocompatible     " Not like Vi
set ruler
filetype on          " USE <CTRL>+P to autocomplete

syntax on            " Enable ssyntax highlighting
set noautoindent     " Autoidentation oVV
set nosmartindent    " no smartZ...

set showmatch        " Blink back to closing bracket (using % key)

"set tabstop=3        " Set Tab size @gleim
set expandtab        " Expand Tabs (pressing Tab inserts spaces)
"set shiftwidth=3     " Number of spaces to use for each step of (auto)indent
"set softtabstop=3    " makes the spaces feel like real tabs; one backspace goes back 3 spaces :)
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
retab               " force all Tab characters to match current Tab prefferences

"set list listchars=tab:**
autocmd FileType spec set filetype=xml
autocmd BufEnter *.xhtml set filetype=html

autocmd BufEnter * set shiftwidth=3 tabstop=3 softtabstop=3

autocmd BufEnter *.php   set shiftwidth=3 tabstop=3 softtabstop=3
autocmd BufEnter *.html  set shiftwidth=3 tabstop=3 softtabstop=3
autocmd BufEnter *.xhtml set shiftwidth=3 tabstop=3 softtabstop=3
autocmd BufEnter *.css   set shiftwidth=3 tabstop=3 softtabstop=3
autocmd BufEnter *.sql   set shiftwidth=3 tabstop=3 softtabstop=3

set bs=2             " backspace ???


" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-

set background=dark  " Highlighting depends on background color (dark or light)

" Turn off search wrapping
  " 'gg' go on top and serch with '/'
  " 'G' go at bootom and search with '?'
set nowrapscan
set ignorecase       " Ignore case in search
set smartcase        " Consider case only when typing Uppercase
set incsearch        " Show search results when typing
set hlsearch         " highlight search pattern
set vb t_vb=         " don't notify (no audio/visual bell)
set showmode         " display mode INSERT/REPLACE/...
"set textwidth=99     " break line at 100 chars
set scrolloff=3      " dont let the curser get too close to the edge
set laststatus=2     " laststatus:  show status line?  Yes, always!


map!  <F1>     <ESC>                   " F1 != Help; remove acces to help :)
map   <F1>     <ESC>
map   <F2>     <ESC>:w                 " Save file ? (Enter for Yes)
map   <F3>     <ESC>:q                 " Exit now ?

" File name
map   <F4>     :echo "File name: " . expand("%")      <CR>

" switch lines
map   <F5>     ddkkp<CR>

"switch between split files
map   2        <c-w>w


" Unhighlight search results
" map <F10> :nohl <CR>
"colorscheme solarized
" Switch background colors
map <F11> :let &background = ( &background == "dark"? "light" : "dark" ) <CR>
" Toggle line numbering on/off
map <F12> :set number! <CR>


" restore position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END



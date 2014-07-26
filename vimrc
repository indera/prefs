" @File              : .vimrc for asura

"set cursorline
set ls=2             " show file path
set bs=2             " backspace ???
set background=dark  " Highlighting depends on background color (dark or light)
"set mouse=a          " use mouse for nav

set nu               " Set line numbering
set nocompatible     " Not like Vi
filetype on          " USE <CTRL>+P to autocomplete 

syntax on            " Enable ssyntax highlighting
"set noautoindent     " Autoidentation oVV
set nosmartindent    " no smartZ...
set splitbelow
set splitright


set showmatch        " Blink back to closing bracket (using % key)

"set tabstop=3        " Set Tab size 
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

autocmd BufEnter *.spec  set shiftwidth=3 tabstop=3 softtabstop=3
autocmd BufEnter *.xml   set shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufEnter *.xsl   set shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufEnter *.xsd   set shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufEnter *.java  set shiftwidth=2 tabstop=2 softtabstop=2

inoremap <C-P><ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P>:call PhpDocSingle()<CR>
vnoremap <C-P>:call PhpDocRange()<CR>


source ~/.vim/php-doc.vim
set dictionary+=/home/asura/.vim/PHP.dict
set complete-=k complete+=k 

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


" -_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-

" JAVA VIM support :)
" http://everything101.sourceforge.net/docs/papers/java_and_vim.html
set path+=., 
set path+=/home/asura/public_html/svn/trunk/src/**, 

autocmd BufRead *.java set include=^#\s*import
autocmd BufRead *.java set includeexpr=substitute(v:fname,'\\.','/','g')

"find and open the file under the cursor 
map gf <C-W>f        
"find and open the class definition of the variable
map gc gdb<C-W>f     

" break the line without returning to insert mode
":map h i[Ctrl+V][Enter][Ctrl+V][Esc][Enter]
:map gn i<CR><ESC>
":nmap <c-cr> i<cr><Esc>

" delete to the end of line and return to normal mode (left and delete)
map gl l<S-D>

map!  <F1>     <ESC>                   " F1 != Help; remove acces to
map   <F1>     <ESC>

" File name 
map   <F4>     :echo "File name: " . expand("%")      <CR>

" switch lines 
map   <F5>     ddkkp<CR> 

" Fold a block of code
" Unfold a block of code
map   <F6>     zfa{  
map   <F7>     zo

map   <F8>     :set nopaste!           " Set nopaste?  
map   <F11>     :echo system("php " . expand("%"))     <CR>
"map   <F10>    :echo system("php -l " . expand("%"))  <CR> 

nnoremap 2 <c-w>wl
"reverse splits
nnoremap 3 <c-w>R
" close all except current
nnoremap 4 <c-w>o
nnoremap 5 :let &background = ( &background == "dark"? "light" : "dark" ) <CR> 
nnoremap 6 :set number! <CR>


" Unhighlight search results
" map <F10> :nohl <CR> 
"colorscheme solarized
" Switch background colors 
"map <F11> :let &background = ( &background == "dark"? "light" : "dark" ) <CR> 
" Toggle line numbering on/off
map <F12> :set number! <CR>

"map! pp <ESC>

" In visual mode: TAB and Shift-TAB for indenting
vmap <TAB>     >
vmap <S-TAB>   <

"       Example: 04.09.00 - 09:53
iab YDT           <C-R>=strftime("%d.%m.%y - %H:%M")<CR>
"       insert the current filename *without* path:
iab YFILE <C-R>=expand("%:t:r")<cr>


" set viminfo='10,\"100,:20,%,n~/.viminfo

"au BufReadPost * 
"\if line("'\"") > 0 |
"\  if line("'\"") <= line("$") |
"\     exe("norm '\"") |
"\  else |
"\     exe "norm $" |
"\  endif | 
"\endif 

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



" Define functions
" http://www.vim.org/tips/tip.php?tip_id=271
function! PoundComment()
  map - :s/^/# /<CR>
  map _ :s/^\s*# \=//<CR>
  set comments=:#
endfunction

function! SlashComment()
  map - :s/^/\/\/ /<CR>        :nohlsearch<CR>
  map _ :s/^\s*\/\/ \=//<CR>   :nohlsearch<CR>
endfunction

" And then later... - or _
autocmd FileType perl      call PoundComment()
autocmd FileType sh        call PoundComment()
autocmd FileType php       call SlashComment()
autocmd FileType java      call SlashComment()

function SetSpace2()
  set shiftwidth=2 tabstop=2 softtabstop=2
endfunction 

" open file:2  as file +2 http://www.vim.org/scripts/script.php?script_id=2184

" http://vim.sourceforge.net/scripts/script.php?script_id=13
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 



" ========= March 1
:filetype plugin on
let mapleader = ","
map <Leader>cd :exe 'cd ' . expand ("%:p:h")<CR>

",f will fold the xml tag on which the cursor is positioned
map <Leader>f v%zf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install http://www.pinkjuice.com/howto/vimxml/setup.xml

" xmledit : A filetype plugin to help edit XML, HTML, and SGML documents --
" allows automatic insertion of closing tag 
" http://www.vim.org/scripts/script.php?script_id=301

" extended % matching for HTML, LaTeX, and many other languages 
"  www.vim.org/scripts/script.php?script_id=39

map <Leader>x :set filetype=xml<CR>
  \:source $VIMRUNTIME/syntax/xml.vim<CR>
  \:set foldmethod=syntax<CR>
  \:source $VIMRUNTIME/syntax/syntax.vim<CR>
  \:colors peachpuff<CR>
  \:source ~/.vim/ftplugin/xml.vim<CR>
  \:iunmap <buffer> <Leader>.<CR>
  \:iunmap <buffer> <Leader>><CR>
  \:inoremap \> ><CR>
  \:echo "XML mode is on"<CR>

" no imaps for <Leader>
:inoremap \. ><CR>

" catalog should be set up
nmap <Leader>l <Leader>cd:%w !xmllint --valid --noout -<CR>
nmap <Leader>r <Leader>cd:%w !rxp -V -N -s -x<CR>
nmap <Leader>d4 :%w !xmllint --dtdvalid 
 \ "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"
 \ --NOOUT -<cr>

vmap <Leader>px !xmllint --format -<CR>
nmap <Leader>px !!xmllint --format -<CR>
nmap <Leader>pxa :%!xmllint --format -<CR>

nmap <Leader>i :%!xsltlint<CR>

" Disable the replace mode !!!
function s:ForbidReplace()
    if v:insertmode isnot# 'i'
        call feedkeys("\<Insert>", "n")
    endif
endfunction
augroup ForbidReplaceMode
    autocmd!
    autocmd InsertEnter  * call s:ForbidReplace()
    autocmd InsertChange * call s:ForbidReplace()
augroup END


"if match($TERM, "screen")!=-1
"  set term=xterm
"  let g:GNU_Screen_used = 1
"else
"  let g:GNU_Screen_used = 0
"endif

" Screen-ify an external command.
"function InScreen(command)
"  return g:GNU_Screen_used ? 'screen '.a:command : a:command
"endfunction

" Free the keys for screen
":unmap  <A-Right>
":unmap! <A-Right>
":unmap  <A-Left>
":unmap! <A-Left>

" Ctrl+s to save
"map <C-s> :w<cr>
"imap <C-s> <ESC>:w<cr>

nnoremap q <nop>
nnoremap K <nop>

set tags=./tags;/

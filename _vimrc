" I Forgot what is this
" map <C-I> <C-Y>
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
hi Folded guibg=#707070
behave mswin
set encoding=utf-8
set gfn=Consolas:h10
set cursorcolumn
map <C-F2> :set cursorcolumn!<CR>
set cursorline
set statusline+=%F
"set showcmd
set fileencodings=utf-8,euckr
set nocompatible
map <C-F5> :set relativenumber!<CR>
"set ignorecase
set nowrap
set ruler laststatus=2 number title hlsearch
set hlsearch  
set autoread
set backspace=indent,eol,start

" make a folding based on tab.
set foldmethod=indent
set foldlevel=7
noremap zh :set foldlevel=0<CR>
noremap zk zr
noremap zj zm
noremap zl :set foldlevel=10<CR>
" copy file names
nmap yf :let @* = expand("%")<CR>
nmap yd :let @* = expand("%:p")<CR>

"test here to 
" noremap zh :set foldlevel=fildlevel-1<CR>
" noremap zl zr
" noremap zj :set foldlevel=1<CR>
" map zk zm
" noremap zl :set foldlevel=fildlevel+1<CR>
" to here 
"
"
"set foldopen=all
"set foldclose=all
colorscheme obsidian2
"...................................................................
syntax on
set nocursorcolumn
set nocursorline
" set norelativenumber
syntax sync minlines=256
"...................................................................
"Visual block find all
vnoremap // y/<C-R>"<CR>

map <C-F3> :let &scrolloff=110-&scrolloff<CR>
set scrolloff=100
"...................................................................
"Added in 2016. 7. 20 : 
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
" Delete without yanking
nnoremap d "_d
vnoremap d "_d
nnoremap c "_c
" Delete with yanking
nnoremap <S-d> dd
"vnoremap p "_dP
nnoremap x "_x
autocmd! bufwritepost .vimrc source %
set pastetoggle=<F2>
set clipboard=unnamed
" let mapleader = " "
let g:netrw_liststyle=3
let g:windowswap_map_keys = 0 "prevent default bindings
"Windows swap"
let g:windowswap_map_keys = 0
nnoremap <silent> <Space>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <Space>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <Space>ww :call WindowSwap#EasyWindowSwap()<CR>
"Quick save command
noremap <Space>s :w<CR>
vnoremap <Space>s <C-C>:w<CR>
"Tab backword in insertmode
inoremap <S-Tab> <C-d>
noremap <Space>q :q<CR>
noremap <Space>Q :q!<CR>
"Quick quit commadn
noremap <Space>c :Calendar<CR>
"next tabpage
noremap <C-Tab> :tabnext<CR>
noremap <C-n> :tabe<CR>
noremap <C-S-Tab> :tabprevious<CR>
"Search & replace all
noremap <C-f> /
noremap / /\c
noremap <S-F> :%s/
nmap <S-Enter> O<Esc>j
nmap <CR> i<CR><Esc>l
nmap <Space><CR> o<Esc>k
"Set indent control
vnoremap < <gv
vnoremap > >gv
"Set t current windowindent control
vnoremap y ygv<esc>
vnoremap Y y
set nobackup
set nowritebackup
set noswapfile
"set guioptions -=m 
set guioptions -=T

"NERDTree"
let NERDTreeShowHidden=1
noremap <Space>e :NERDTree<CR>
noremap <Space>E :NERDTree
noremap <Space>t :FufFile<CR>

"...................................................................
function! StartUp()
    simalt ~x
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
let NERDTreeShowBookmarks=1
"...................................................................

"...................................................................
"Added in 2016. 6. 27 : to make a auto generated code for js and html 
"Plugin 'pangloss/vim-javascript'
"...................................................................
"Added in 2016. 5. 16 : to make a view before close and re open that view
"after it opens

    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview 
"...................................................................
set tabstop=4 shiftwidth=4 expandtab

"...................................................................
"Added in 2016. 9. 15 : to make cursor noticible
"...................................................................
" set cursorcolumn 
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" highlight Cursor guifg=white guibg=orange
" highlight iCursor guifg=white guibg=steelblue
" hi MatchParen guibg=NONE guifg=#ff005f gui=bold
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
"Added in 2016. 9. 15 : to make cursor noticible
"...................................................................
"...................................................................
"Added in 2016. 10. 26 : Matching Tag
"...................................................................
filetype plugin on 
"...................................................................

map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>

"Page down and up :    'ê'= Alt + j   and  'ë' = Alt + k
noremap ê 10j 
noremap ë 10k
"end Page down and up 

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" SeeTab: toggles between showing tabs and using standard listchars
fu! SeeTab() 
  if !exists("g:SeeTabEnabled")
    let g:SeeTabEnabled = 1
    let g:SeeTab_list = &list
    let g:SeeTab_listchars = &listchars
    let regA = @a
    redir @a
    hi SpecialKey
    redir END
    let g:SeeTabSpecialKey = @a
    let @a = regA
    silent! hi SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=magenta
    set list
    set listchars=tab:\|\
  else
    let &list = g:SeeTab_list
    let &listchars = &listchars
    silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
    unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
  endif
endfunc
com! -nargs=0 SeeTab :call SeeTab()



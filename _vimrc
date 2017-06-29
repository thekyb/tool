""""""""""""""""""""""""""""""""""""""
"            Appearance              "
""""""""""""""""""""""""""""""""""""""
colorscheme obsidian2
set ruler laststatus=2 number title
set cursorline 
set nocursorcolumn
map <C-F2> :set cursorcolumn!<CR>
set titlestring=%f title    " Display filename in terminal window
set rulerformat=%l:%c ruler " Display current column/line
map <C-F3> :let &scrolloff=110-&scrolloff<CR>
set scrolloff=100
hi Folded guibg=#707070
"...................................................................
"Added in 2016. 9. 15 : to make cursor noticible
">>>>...............................................................
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
"<<<<...............................................................

""""""""""""""""""""""""""""""""""""""
"          Search & Replace          "
""""""""""""""""""""""""""""""""""""""
set hlsearch  
set encoding=utf-8
vnoremap // y/<C-R>"<CR>
noremap <C-f> /
noremap / /\c
noremap <S-F> :%s/
" copy file names
nmap yf :let @* = expand("%")<CR>
nmap yd :let @* = expand("%:p")<CR>

""""""""""""""""""""""""""""""""""""""
"           Movement                 "
""""""""""""""""""""""""""""""""""""""
nmap <S-Enter> O<Esc>j
nmap <CR> i<CR><Esc>l
nmap <Space><CR> o<Esc>k
" Delete without yanking
nnoremap d "_d
vnoremap d "_d
nnoremap c "_c
" Delete with yanking
nnoremap <S-d> dd
"vnoremap p "_dP
nnoremap x "_x

""""""""""""""""""""""""""""""""""""""
"           General Settings         "
""""""""""""""""""""""""""""""""""""""
syntax on
" set norelativenumber
syntax sync minlines=256
set ttyfast
set tabstop=4 shiftwidth=4 expandtab
set smarttab                                                         " tab and backspace are smart " 

"""""""""""""""""""""""""""""""""""""""
"           Menu completions          "
"""""""""""""""""""""""""""""""""""""""
set wildmode=full wildmenu                            " Command-line tab completion
set infercase                                         " AutoComplete in Vim
set completeopt=longest,menu,menuone
set wildignore+=*.o,*.obj,*.pyc,*.DS_STORE,*.db,*.swc


"""""""""""""""""""""""""""""""""""""""
"           GUI Stuff                 "
"""""""""""""""""""""""""""""""""""""""
set mousemodel=extend " Enable mouse support
set selectmode=mouse
set mousefocus
set mouse=a
set guioptions -=T

"""""""""""""""""""""""""""""""""""""""
"           Spelling                  "
"""""""""""""""""""""""""""""""""""""""
if v:version >= 700
  setlocal spelllang=en
  nmap <Space>ll :set spell!<CR>
endif
"   Correct some spelling mistakes    "
ia teh      the
ia htis     this
ia tihs     this
ia funciton function
ia fucntion function
ia funtion  function
ia retunr   return
ia reutrn   return
ia sefl     self
ia eslf     self

"""""""""""""""""""""""""""""""""""""""
"           backup options            "
"""""""""""""""""""""""""""""""""""""""
" set backupdir=~/tmp,/tmp " backups (~)
" set directory=~/tmp,/tmp " swap files
" set nowritebackup
" set noswapfile
"set guioptions -=m 

set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap//
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

""""""""""""""""""""""""""""""""""""""
"           NERDTree                 "
""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
noremap <Space>e :NERDTree<CR>
noremap <Space>E :NERDTree

""""""""""""""""""""""""""""""""""""""
"           CtrlP                    "
""""""""""""""""""""""""""""""""""""""
noremap <Space>d :CtrlP<CR>
noremap <Space>D :CtrlP
""""""""""""""""""""""""""""""""""""""
"           StartUp                  "
""""""""""""""""""""""""""""""""""""""
function! StartUp()
    simalt ~x
    NERDTree
endfunction

autocmd VimEnter * call StartUp()

"""""""""""""""""""""""""""""""""""""""
"    Start Original Kyb Here          "
"""""""""""""""""""""""""""""""""""""""
" I Forgot what is this
" map <C-I> <C-Y>
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set gfn=Consolas:h10
set statusline+=%F
set fileencodings=utf-8,euckr
set nocompatible
map <C-F5> :set relativenumber!<CR>
"set ignorecase
set nowrap
set autoread
set backspace=indent,eol,start

" make a folding based on tab.
set foldmethod=indent
set foldlevel=7
noremap zh :set foldlevel=0<CR>
noremap zk zr
noremap zj zm
noremap zl :set foldlevel=10<CR>

map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 
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
"Set indent control
vnoremap < <gv
vnoremap > >gv
"Set t current windowindent control
vnoremap y ygv<esc>
vnoremap Y y


"...................................................................
"Added in 2016. 5. 16 : to make a view before close and re open that view after it opens

    " autocmd BufWinLeave *.* mkview
    " autocmd BufWinEnter *.* silent loadview 
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

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'https://github.com/Shougo/vimproc.vim.git'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

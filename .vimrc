" init autocmd
autocmd!

" set script encoding
scriptencoding utf-8

" stop loading config if it's on tiny or small
if !1 | finish | endif

" basic configs
set exrc
set number
set relativenumber
set nocompatible
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set hidden
set autoread
set autoindent
set background=dark
set nobackup
set nowritebackup
set nohlsearch
set noerrorbells
set noswapfile
"set nowrap
set showcmd
set incsearch
set cmdheight=1
set colorcolumn=80
"set signcolumn=yes
set laststatus=2
set scrolloff=10
"set clipboard=unnamedplus
set expandtab
set updatetime=50
"set timeoutlen=100
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" trigger checktime
au FocusGained, BufEnter * :checktime " on buffer change or terminal focus

"saving as root
"cmap w! w !sudo tee %

"title configs
set title
set titleold=

" incremental substitution
if has('nvim')
    set inccommand=split
endif

" auto source vim files
" au! BufWritePost $MYVIMRC source %

" suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=
set nosc noru nosm

" don't redraw while executing macros (good performance config)
set lazyredraw

" ignore case when searching
set ignorecase

" be smart when using tabs ;)
set smarttab

" indents
filetype indent on
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent

" finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" for conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" add asterisks in block comments
set formatoptions+=r

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType ex setlocal shiftwidth=2 tabstop=2

" javaScript
au BufNewFile,BufRead *.es6 setf javascript
" typeScript
au BufNewFile,BufRead *.tsx setf typescript
" markdown
au BufNewFile,BufRead *.md set filetype=markdown
" flow
au BufNewFile,BufRead *.flow set filetype=javascript

"-------------------------------------------------------------------------------
" Cursor line
"-------------------------------------------------------------------------------

set cursorline

" set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr       cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"-------------------------------------------------------------------------------
" Imports
"-------------------------------------------------------------------------------

if has("unix")
    let s:uname = system("uname -s")
    " Do Mac stuff
    if s:uname == "Darwin\n"
        source ~/.vimrc.osx
    endif
endif

source ~/.vimrc.maps
source ~/.vimrc.plugins
source ~/.vimrc.lightline

"-------------------------------------------------------------------------------
" Color scheme
"-------------------------------------------------------------------------------
syntax enable
colorscheme gruvbox
"highlight Normal guibg=none

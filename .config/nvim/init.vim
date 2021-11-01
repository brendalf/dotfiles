"--------------------------------------------------------
" General 
"--------------------------------------------------------
" init autocmd
autocmd!

" set script encoding
scriptencoding utf-8

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
set showcmd
set incsearch
set cmdheight=1
set colorcolumn=80
"set signcolumn=yes
set laststatus=2
set scrolloff=10
set clipboard=unnamedplus
set expandtab
set updatetime=50
set shell=fish
set backupskip=/tmp/*,/private/tmp/*

filetype plugin on

" trigger checktime
au FocusGained, BufEnter * :checktime " on buffer change or terminal focus

" title configs
set title
set titleold=

" incremental substitution
set inccommand=split

" suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=
set nosc noru nosm

" don't redraw while executing macros (good performance config)
set lazyredraw

" ignore case when searching
set ignorecase

" be smart when using tabs ;)
set smarttab

" indent
filetype indent on
set shiftwidth=4
set tabstop=4
set backspace=start,eol,indent

" auto indent
set ai

" smart indent
set si

" no wrap lines
set nowrap 

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
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md,.ex,.exs,.ts

" local identation
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType elixir setlocal shiftwidth=2 tabstop=2

"-------------------------------------------------------------------------------
" Filetypes
"-------------------------------------------------------------------------------
" javascript
au BufNewFile,BufRead *.es6 setf javascript
" typescript
au BufNewFile,BufRead *.tsx setf typescript
" markdown
au BufNewFile,BufRead *.md set filetype=markdown
" flow
au BufNewFile,BufRead *.flow set filetype=javascript
" elixir
au BufNewFile,BufRead *.ex set filetype=elixir
au BufNewFile,BufRead *.exs set filetype=elixir

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

"if &term =~ "screen"
"  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
"  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
" endif

"--------------------------------------------------------
" Python host
"--------------------------------------------------------
let g:python3_host_prog = expand("/usr/bin/python3")
let g:python_host_prog = expand("/usr/bin/python")

"-------------------------------------------------------------------------------
" Mac OS
"-------------------------------------------------------------------------------
if has("unix")
    let s:uname = system("uname -s")
    " Do Mac stuff
    if s:uname == "Darwin\n"
        runtime ./macos.vim
    endif
endif

"--------------------------------------------------------
" Plugins
"--------------------------------------------------------
runtime ./plug.vim

"--------------------------------------------------------
" Key Maps
"--------------------------------------------------------
runtime ./maps.vim

"--------------------------------------------------------
" Colorscheme 
"--------------------------------------------------------
syntax enable
colorscheme gruvbox

"--------------------------------------------------------
" Unmaps 
"--------------------------------------------------------
unmap <C-i>

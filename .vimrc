set nocp
" Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" buffer manager <3
Plugin 'fholgado/minibufexpl.vim'
" Syntax checker
Plugin 'Syntastic'
" Plugin 'Raimondi/delimitMate';
Plugin 'cohama/lexima.vim'
" gcc comment
Plugin 'tComment'
" nicer 'f
Plugin 'rhysd/clever-f.vim'
" lightline
Plugin 'itchyny/lightline.vim'
" multiple cursor editing
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'craigemery/vim-autotag'
"PHP Plugins
" auto doc php
Plugin 'tobyS/pdv'
" phpfolding
Plugin 'rayburgemeestre/phpfolding.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'docteurklein/php-getter-setter.vim'
call vundle#end()            " required
filetype plugin indent on

" My config

set tags+=tags,tags.vendors

" OS determination
let g:OS = 'linux'

let os = substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  let g:OS = 'osx'
endif

set t_Co=256

" Color scheme
if OS == 'linux'
  set background=dark
endif

colorscheme Tomorrow-Night
syn on

set syntax=on
set nocompatible
set number " enable line numbers
set showcmd
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set showmatch
" set colorcolumn=81

set hidden " allow the use of unsaved buffer
set prompt " prompt on saving
set backspace=indent,eol,start " Better handling of backspace key
set nostartofline              " Emulate typical editor navigation behaviour

if OS == 'osx'
  set dir=/private/tmp
else
  set dir=~/.tmp
endif

set nobackup
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab
set shiftround

set incsearch
set smartcase
set spelllang=en
set nospell
set spellsuggest=5
set showmode
set laststatus=2

" split more naturally
set splitright
set splitbelow

set cul " highlight current line

" Configure invisible characters
set nolist
" set listchars=trail:·,eol:¬,tab:┊\

set noautochdir "cd to file cwd

" wrap to previous line when cursor reach eol/beginning
set whichwrap+=<,>,h,l,[,]

" Key mapping

" Replacing : by ; cmd
nore ; :
" Replacing ; by , to match next f,t,F,T
nore , ;

" Mapping space to leader key
map <Space> <Leader>

"semicolons helper
nnoremap <Leader>; A;<esc>

"paste helper
nnoremap <Leader>p :set paste!<CR>

" Replaces tabs with spaces
nnoremap <Leader>t :0,$s/\t/  /g<CR>

vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y

nnoremap <S-L> :MBEbn<CR>
nnoremap <S-H> :MBEbp<CR>

" Delete buffer but leave window open
nnoremap <Leader>q :MBEbd<CR>

" Navigate between splits more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-J> }
nnoremap <S-K> {

vnoremap <S-J> }
vnoremap <S-K> {

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.scss set filetype=scss.css " ultisnips css for scss
autocmd BufRead,BufNewFile *.css  source ~/.vim/ftplugin/css.vim
autocmd BufRead,BufNewFile *.php  source ~/.vim/ftplugin/php.vim
autocmd BufRead,BufNewFile *.yml  source ~/.vim/ftplugin/php.vim
autocmd BufRead,BufNewFile *.js source ~/.vim/ftplugin/javascript.vim
autocmd BufRead,BufNewFile *.json source ~/.vim/ftplugin/javascript.vim
autocmd BufRead,BufNewFile *.html source ~/.vim/ftplugin/html.vim

" Chdir to current file
let g:NERDTreeChDirMode=1
let g:NERDTreeShowBookmarks=1
" NERDTree window size
let g:NERDTreeWinSize=35
let g:NERDTreeBookmarksFile = $HOME ."/.vim/bundle/nerdtree/bookmarks"
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMinimalUI=1
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map NERDTree to ' n'
map <Leader>n :NERDTreeToggle<CR>

let g:miniBufExplBRSplit=0
let g:miniBufExplCycleArround=1

" Comment block
map <Leader>g :TCommentBlock<CR>
vmap gb :TCommentBlock<CR>

" pdv template dir
nnoremap <C-o> za
nnoremap <C-S-O> zR
nnoremap <C-c> zM

let g:lock = "🔒""

let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"'.g:lock.'":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
\ }

autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

" auto remove/hi trailing space
autocmd BufWritePre * :%s/\s\+$//e

set nocp
filetype off
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'embear/vim-localvimrc'
" Lightline FTW
Plug 'itchyny/lightline.vim'
Plug 'daviesjamie/vim-base16-lightline'
" Plug 'maximbaz/lightline-ale'
" buffer manager <3
Plug 'fholgado/minibufexpl.vim'
" Replaces :MBEbd from minibufexpl cause it is bugged
Plug 'qpkorr/vim-bufkill'

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Syntax
Plug 'sheerun/vim-polyglot'

" Html close tags
Plug 'docunext/closetag.vim'
" Auto close )'"`
Plug 'jiangmiao/auto-pairs'

" gcc comment
Plug 'tomtom/tcomment_vim'

" multiple cursor editing
Plug 'terryma/vim-multiple-cursors'

" Auto update ctags
Plug 'craigemery/vim-autotag'

" "PHP Plugs
Plug 'phpactor/phpactor', {'for': 'php'}
" " phpfolding
Plug 'rayburgemeestre/phpfolding.vim', {'for': 'php'}
" " Command to add getter/setter BUGGED
" Plug 'docteurklein/php-getter-setter.vim', {'for': 'php'}

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" git gutter
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Completion
Plug 'maralla/completor.vim'
" auto doc php
" Plug 'tobyS/vmustache'
" Plug 'tobyS/pdv'
" Plug 'arnaud-lb/vim-php-namespace'
" javascript
" Plug 'pangloss/vim-javascript'
" Ts
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'heavenshell/vim-jsdoc'
call plug#end()
" My config

set tags+=tags,tags.vendor

" OS determination
let g:OS = 'linux'

let os = substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  let g:OS = 'osx'
endif

" Colors
let base16colorspace=256
set background=dark

colorscheme default

" Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
if $TMUX != ""
  set t_ut=
endif

colorscheme base16-tomorrow-night
syntax on

" Settings
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
set diffopt=vertical,context:4

if OS == 'osx'
  set dir=/private/tmp
else
  set dir=/tmp
endif

set nobackup
set backupcopy=yes " When watching things with webpack etc
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab
set shiftround

set ignorecase
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

noremap ; :

" F/T forward backward
noremap , ;
" noremap <lt> ,

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
nnoremap <Leader>q :BD<CR>

" Navigate between splits more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-J> }
nnoremap <S-K> {

vnoremap <S-J> }
vnoremap <S-K> {

" Key mapping to expand foldings
nnoremap <C-o> za
nnoremap <C-S-O> zR
nnoremap <C-c> zM

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.scss set filetype=scss.css " ultisnips css for scss
autocmd BufRead,BufNewFile *.css  source ~/.vim/ftplugin/css.vim
autocmd BufRead,BufNewFile *.php  source ~/.vim/ftplugin/php.vim
autocmd BufRead,BufNewFile *.yml  source ~/.vim/ftplugin/php.vim
autocmd BufRead,BufNewFile *.js source ~/.vim/ftplugin/javascript.vim
autocmd BufRead,BufNewFile *.json source ~/.vim/ftplugin/javascript.vim
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.html source ~/.vim/ftplugin/html.vim
autocmd BufRead,BufNewFile *.feature set ts=2 sw=2

" auto remove/hi trailing space
autocmd BufWritePre * :%s/\s\+$//e

" NERDTree options
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

" MinBufExpl options
let g:miniBufExplBRSplit=0
let g:miniBufExplCycleArround=1

" Comment block
vmap gb :TCommentBlock<CR>

let g:lock = "🔒""
let g:lightline = {
      \ 'colorscheme': 'base16',
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

nnoremap <C-p> :FZF<CR>

let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver', 'typecheck'],
\   'javascript': ['standard'],
\}

let g:ale_lint_on_text_changed = 'never'

map <Leader>g :GitGutterToggle<CR>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

let g:localvimrc_ask=0

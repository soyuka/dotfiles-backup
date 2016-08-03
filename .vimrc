set nocp
" Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
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
Plugin 'tobyS/vmustache'
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
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>
nnoremap <C-o> za
nnoremap <C-S-O> zR
nnoremap <C-c> zM

"Map ctrl+p
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async', 'ignore_pattern', 'vendor\|bower_components\|node_modules\|.git')

nnoremap <C-p> :Unite -start-insert file_rec/async<CR>
nnoremap <silent> <Leader>/ :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
  let g:unite_source_rec_async_command = 'pt --nogroup --nocolor -S -g .'
endif

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

let maplocalleader = ','
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Use neocomplete.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" https://github.com/Shougo/neosnippet.vim/issues/184
let g:neocomplete#enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neosnippet#enable_snipmate_compatibility = 1

imap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" <TAB>: completion.
imap <silent><expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
            \ "\<C-n>" : "\<TAB>")
" Shift tab (C-p)
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""

" auto remove/hi trailing space
autocmd BufWritePre * :%s/\s\+$//e

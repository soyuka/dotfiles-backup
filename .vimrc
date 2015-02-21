set nocp
" Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlp.vim'
" buffer manager <3
Plugin 'fholgado/minibufexpl.vim'
" Syntax checker
Plugin 'Syntastic'
" auto close pairs
" Plugin 'Townk/vim-autoclose'
Plugin 'Raimondi/delimitMate'
" crap it is
" Plugin 'jiangmiao/auto-pairs'
" git wrapper
Plugin 'fugitive.vim'
" gcc comment
Plugin 'tComment'
" nicer 'f
Plugin 'rhysd/clever-f.vim'
" lightline
Plugin 'itchyny/lightline.vim'
" multiple cursor editing 
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
" auto doc php
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
" phpfolding
Plugin 'rayburgemeestre/phpfolding.vim'
" php complete
Plugin 'shawncplus/phpcomplete.vim'
" Nice js plugins
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-obsession'
" tab autocomplete/snips
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" go
Plugin 'fatih/vim-go'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" scss syntax
Plugin 'cakebaker/scss-syntax.vim'
" angular snippets
Plugin 'matthewsimo/angular-vim-snippets'

call vundle#end()            " required
filetype plugin indent on

" My config

" Reminder :
" set [no]paste " to paste without indentation
" % " to get to next matching parenthesis

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
set number " disable line numbers
set showcmd
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set showmatch

set hidden " allow the use of unsaved buffer
set prompt " prompt on saving
set backspace=indent,eol,start " Better handling of backspace key
set nostartofline              " Emulate typical editor navigation behaviour

if OS == 'osx'
  set dir=/private/tmp
else
  set dir=/tmp
endif

set nobackup

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" 2 space tabs

set shiftwidth=2
set softtabstop=2

set incsearch
" that feature is awesome (http://ask.fclose.com/150/how-to-make-case-insensitive-search-in-vim-vi)
set ignorecase
set smartcase
set spelllang=en
set nospell
set spellsuggest=5
set showmode

set laststatus=2

" split more naturally
set splitright
set splitbelow

" if OS == 'osx'
  set cul " highlight current line
" else
  " highlight CursorLine term=bold ctermfg=0 ctermbg=8 guifg=#cecece guibg=#282827
  " highlight SpellBad ctermbg=0 guibg=#282827
  " highlight SpellBad cterm=none ctermbg=none ctermfg=231
  " set cul
" endif

" Configure invisible characters
set nolist
" set listchars=trail:·,eol:¬,tab:┊\ 
hi NonText term=bold ctermfg=0 guifg=#ffffff gui=bold

set autochdir "cd to file cwd

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

" Delete buffer but leave window open
nnoremap <Leader>q :MBEbd<CR>

vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y

nnoremap <Leader>f :MBEFocus<CR>
nnoremap <S-L> :MBEbn<CR>
nnoremap <S-H> :MBEbp<CR>

" map CTRL-E to end of line (insert mode)
" imap <C-e> <esc>$i<right>

" map CTRL-A to begining of line (insert mode)
" imap <C-a> <esc>0i<right>

" map ctrl-E, ctrl-A normal mode
" nmap <C-e> $
" nmap <C-a> 0

" Navigate between splits more naturally
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
      
" map Shift-move to move 10to10
nnoremap <S-J> }
nnoremap <S-K> {

vnoremap <S-J> }
vnoremap <S-K> {
vnoremap <S-L> w
vnoremap <S-H> 10<Left>

au BufRead,BufNewFile *.md set filetype=markdown
autocmd filetype crontab setlocal nobackup nowritebackup
au BufRead,BufNewFile *.scss set filetype=scss.css " ultisnips css for scss

autocmd Filetype php setlocal ts=4 st=4 sw=4
autocmd Filetype css setlocal ts=4 st=4 sw=4
" Plugins configuration

"Set syntax angularjs
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1

" clever f
let g:clever_f_smart_case = 1

" Chdir to current file
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=1
" NERDTree window size
let g:NERDTreeWinSize=35
let g:NERDTreeBookmarksFile = $HOME ."/.vim/bundle/NERDTree/bookmarks"
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMinimalUI=1

let g:miniBufExplBRSplit=0
let g:miniBufExplCycleArround=1

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map NERDTree to ' n'
map <Leader>n :NERDTreeToggle<CR>

" Comment block
map <Leader>g :TCommentBlock<CR>
vmap gb :TCommentBlock<CR>

" Set syntastic config
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
" Ignore html errors angular
let g:syntastic_html_tidy_ignore_errors = [
    \"trimming empty <i>",
    \"trimming empty <span>",
    \"<input> proprietary attribute \"autocomplete\"",
    \"proprietary attribute \"role\"",
    \"proprietary attribute \"hidden\"",
\]

" Indent guides
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Disable PIV folding
" set nofoldenable
" let g:DisableAutoPHPFolding = 1 " disable PIV's folding

" pdv template dir
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>
nnoremap <C-o> za
nnoremap <C-S-O> zR
nnoremap <C-c> zM

"Map ctrl+p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|bower_components\|tmp$'
  \ }

if OS == 'linux'
  let g:lock = "✎"
else
  let g:lock = "🔒""
endif

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

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

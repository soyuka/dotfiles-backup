setlocal ts=4
setlocal sw=4
setlocal expandtab
setlocal autoindent
setlocal smarttab

autocmd FileType php setlocal omnifunc=phpactor#Complete

nmap <Leader>u :call phpactor#UseAdd()<CR>
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" pdv template dir
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

let g:php_namespace_sort_after_insert = 1

let g:no_php_maps = 1
" nnmap <buffer> <Leader> <Plug>PhpgetsetInsertGetterSetter
" <Plug>PhpgetsetInsertGetterOnly
" <Plug>PhpgetsetInsertSetterOnly
" <Plug>PhpgetsetInsertBothGetterSetter

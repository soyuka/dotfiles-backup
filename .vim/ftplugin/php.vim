setlocal ts=4
setlocal sw=4
setlocal expandtab
setlocal autoindent
setlocal smarttab

" autocmd FileType php setlocal omnifunc=phpactor#Complete

" let maplocalleader = ','
" nmap <Leader>u :call PhpInsertUse()<CR>
" nmap <Leader>e :call PhpExpandClass()<CR>
" nmap <Leader>e :call PhpExpandClass()<CR>

map <Leader>u :call phpactor#UseAdd()<CR>
map <Leader>o :call phpactor#GotoType()<CR>
map <Leader>pd :call phpactor#OffsetTypeInfo()<CR>
map <Leader>i :call phpactor#ReflectAtOffset()<CR>
map <Leader>pfm :call phpactor#MoveFile()<CR>
map <Leader>pfc :call phpactor#CopyFile()<CR>
map <Leader>tt :call phpactor#Transform()<CR>

" pdv template dir
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

let g:php_namespace_sort_after_insert = 1

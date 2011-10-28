" Tabs Settings
setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=80

"Eclim
nnoremap <silent> <buffer> <leader>eji :JavaImportMissing<cr>
nnoremap <silent> <buffer> <leader>ejd :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <leader>ejs :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>ejr :JavaCorrect<cr>
nnoremap <silent> <buffer> <leader>ejc :JavaImportClean<cr>:JavaImportSort<cr>


"javacomplete.vim fun
"setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo

"JavaImp.vim fun
"let g:JavaImpPathSep = ':'
"let g:JavaImpPaths = './:src/:'.$HOME."/cur/rent/CSE\ 559/project/lab1/src/:".$HOME."/.vim/JavaImp/jmplst/"
"let g:JavaImpDataDir = $HOME."/.vim/JavaImp" 
"let g:JavaImpSortPkgSep = 0
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 

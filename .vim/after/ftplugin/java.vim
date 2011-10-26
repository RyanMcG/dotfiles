" Tabs Settings
setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab textwidth=80

"Eclim
nnoremap <silent> <buffer> <leader>ji :JavaImportMissing<cr>
nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <leader>js :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>jr :JavaCorrect<cr>
nnoremap <silent> <buffer> <leader>jc :JavaImportClean<cr>:JavaImportSort<cr>


"javacomplete.vim fun
"setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo

"JavaImp.vim fun
"let g:JavaImpPathSep = ':'
"let g:JavaImpPaths = './:src/:'.$HOME."/cur/rent/CSE\ 559/project/lab1/src/:".$HOME."/.vim/JavaImp/jmplst/"
"let g:JavaImpDataDir = $HOME."/.vim/JavaImp" 
"let g:JavaImpSortPkgSep = 0
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P> 

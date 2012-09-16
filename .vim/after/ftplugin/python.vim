"Python config after/ftplugin
setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab textwidth=79

"Eclim
nnoremap <silent> <buffer> <leader>epd :PythonFindDefinition<cr>
nnoremap <silent> <buffer> <leader>eps :PythonSearchContext<cr>
nnoremap <silent> <buffer> <leader>epc :PythonImportClean<cr>:PythonImportSort<cr>

setlocal completefunc=pythoncomplete#Complete
setlocal omnifunc=pythoncomplete#Complete
setlocal completeopt=menuone,longest,preview

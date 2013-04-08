"Python config after/ftplugin
setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab textwidth=79

"Eclim
nnoremap <silent> <buffer> <leader>epd :PythonFindDefinition<cr>
nnoremap <silent> <buffer> <leader>eps :PythonSearchContext<cr>
nnoremap <silent> <buffer> <leader>epc :PythonImportClean<cr>:PythonImportSort<cr>

xmap ay <Plug>(textobj-python-function-a)
omap ay <Plug>(textobj-python-function-a)
xmap iy <Plug>(textobj-python-function-i)
omap iy <Plug>(textobj-python-function-i)

"Python config after/ftplugin
setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab textwidth=90 colorcolumn=90

xmap ay <Plug>(textobj-python-function-a)
omap ay <Plug>(textobj-python-function-a)
xmap iy <Plug>(textobj-python-function-i)
omap iy <Plug>(textobj-python-function-i)

nnoremap <leader>B Oimport pdb; pdb.set_trace()<esc>
nnoremap <leader>b oimport pdb; pdb.set_trace()<esc>
nnoremap <leader>T Ofrom nose.tools import set_trace; set_trace()<esc>
nnoremap <leader>t ofrom nose.tools import set_trace; set_trace()<esc>

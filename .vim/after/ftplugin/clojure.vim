" Some extra formatting
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
setlocal textwidth=80
setlocal path+=src/

" Mapping for slamhound
nnoremap <LocalLeader>sh :Slamhound<CR>

" Unmap conflicting mappings
silent! nunmap <p
silent! nunmap <P
silent! nunmap >p
silent! nunmap >P

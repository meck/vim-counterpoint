if !exists('g:counterpoint_enable_mappings')
  let g:counterpoint_enable_mappings=1
endif

if g:counterpoint_enable_mappings
  nnoremap <silent> <leader>h. :call counterpoint#formatLine('pointfree')<CR>
  vnoremap <silent> <leader>h. :call counterpoint#formatSelection('pointfree')<CR>
  nnoremap <silent> <leader>h> :call counterpoint#formatLine('pointful')<CR>
  vnoremap <silent> <leader>h> :call counterpoint#formatSelection('pointful')<CR>
endif

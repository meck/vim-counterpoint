if !exists('g:contrapoint_enablemappings')
  let g:contrapoint_enablemappings=1
endif

if g:contrapoint_enablemappings
  nnoremap <silent> <leader>h. :call counterpoint#formatLine('pointfree')<CR>
  vnoremap <silent> <leader>h. :call counterpoint#formatSelection('pointfree')<CR>
  nnoremap <silent> <leader>h> :call counterpoint#formatLine('pointful')<CR>
  vnoremap <silent> <leader>h> :call counterpoint#formatSelection('pointful')<CR>
endif

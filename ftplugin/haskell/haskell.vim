if !exists('g:contrapoint_enablemappings')
  let g:contrapoint_enablemappings=1
endif

if g:contrapoint_enablemappings
  noremap <silent> <leader>h. :call counterpoint#pointfree()<CR>
  noremap <silent> <leader>h> :call counterpoint#pointful()<CR>
endif

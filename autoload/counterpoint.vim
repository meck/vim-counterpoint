function! s:runPointFree(expression)
  if !executable("pointfree")
    echomsg "pointfree not found on $PATH, did you install it? (https://github.com/bmillwood/pointfree)"
    return
  endif

  let l:result = system("pointfree " . shellescape(a:expression))

  if v:shell_error || a:expression ==# ""
    echohl WarningMsg
    echo "Pointfree Error"
    echohl None
    return a:expression
  endif

  return l:result
endfunction

function! s:runPointFul(expression)
  if !executable("pointful")
    echomsg "pointful not found on $PATH, did you install it? (https://github.com/23Skidoo/pointful)"
    return
  endif

  let l:result = system("pointful " . shellescape(a:expression))

  if v:shell_error || a:expression ==# ""
    echohl WarningMsg
    echo "Pointful Error"
    echohl None
    return a:expression
  endif

  return l:result
endfunction

function! counterpoint#pointfree() range
  let b:winview = winsaveview()

  let l:expression = join(getline(a:firstline, a:lastline), "\n")

  if l:expression == ""
    return
  endif

  let l:pfExp = split(s:runPointFree(l:expression), "\n")

  call setline(a:firstline, pfExp)

  " remove any lines left over from any concatenation of the expression
  if (a:lastline - a:firstline + 1) - len(l:pfExp)
   silent! execute a:firstline + len(l:pfExp) . ',' . a:lastline . 'delete _'
  endif

  call winrestview(b:winview)
endfunction

function! counterpoint#pointful() range
  let b:winview = winsaveview()

  let l:expression = join(getline(a:firstline, a:lastline), "\n")

  if l:expression == ""
    return
  endif

  let l:pfExp = split(s:runPointFul(l:expression), "\n")

  call setline(a:firstline, pfExp)

  " remove any lines left over from any concatenation of the expression
  if (a:lastline - a:firstline + 1) - len(l:pfExp)
   silent! execute a:firstline + len(l:pfExp) . ',' . a:lastline . 'delete _'
  endif

  call winrestview(b:winview)
endfunction

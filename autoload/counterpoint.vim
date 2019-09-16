function! s:run_formater(formater, expression)
  if !executable(a:formater)
    echomsg a:formater . " not found on $PATH, did you install it?"
    return
  endif

  let l:result = system(a:formater . " " . shellescape(a:expression))

  if v:shell_error || a:expression ==# ''
    echohl WarningMsg
    echo a:formater . " Error"
    echohl None
    return a:expression
  endif

  return l:result
endfunction

function! counterpoint#formatLine(formater) range
  let b:winview = winsaveview()

  let l:expression = join(getline(a:firstline, a:lastline), "\n")

  if l:expression == ""
    return
  endif

  let l:pfExp = split(s:run_formater(a:formater, l:expression), "\n")

  call setline(a:firstline, pfExp)

  " remove any lines left over from any concatenation of the expression
  if (a:lastline - a:firstline + 1) - len(l:pfExp)
   silent! execute a:firstline + len(l:pfExp) . ',' . a:lastline . 'delete _'
  endif

  call winrestview(b:winview)
endfunction


function! counterpoint#formatSelection(formater) range
  let l:old_reg = getreg("a")
  let l:old_reg_type = getregtype("a")
  
  let @a = s:run_formater(a:formater, s:get_visual_selection())
  
  " Remove any extra linebreaks added by system() if the selction ends inline
  if s:visual_selection_inline()
    let @a=substitute(strtrans(@a),'\^@','','g')
  endif

  " Reselect visual, delete to "_, and paste reg a
  execute 'normal! gv"_d"aP'

  " Restore register a
  call setreg("a", l:old_reg, l:old_reg_type)
endfunction

" https://stackoverflow.com/a/6271254
function! s:get_visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! s:visual_selection_inline()  
    let [line_end, column_end] = getpos("'>")[1:2]
    return column_end < strlen(getline(line_end))
endfunction

function! counterpoint#pointful_visual() range
endfunction

function! GetCommentString ()
  if &ft =~ '^\(c\|cpp\|java\|javascript\)$'
    return '\/\/ '
  elseif &ft =~ '^\(go\)$'
    return '\/\/	'
  elseif &ft =~ '^\(vim\)$'
    return '" '
  elseif &ft =~ '^\(lua\)$'
    return '-- '
  endif
  " default
  return '# '
endfunction

function! Comment () range
  exec a:firstline . ',' . a:lastline . 'yank'
  exec 'silent ' . a:firstline . ',' . a:lastline . 's/^/' . GetCommentString () . '/'
  exec 'normal ' . a:lastline . 'g'
endfunction

function! UnComment () range
  exec 'silent ' . a:firstline . ',' . a:lastline . 's/^' . GetCommentString () . '//e'
endfunction

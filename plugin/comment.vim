function! GetCommentString ()
  if &ft =~ '^\(c\|cpp\|java\|go\|javascript\)$'
    return '\/\/'
  elseif &ft =~ '^\(vim\)$'
    return '"'
  elseif &ft =~ '^\(lua\)$'
    return '--'
  endif
  " default
  return '#'
endfunction

function! Comment () range
  exec a:firstline . ',' . a:lastline . 'yank'
  exec 'silent ' . a:firstline . ',' . a:lastline . 's/^\(\s*\)/\1' . GetCommentString () . ' /'
  exec 'normal ' . a:lastline . 'g'
endfunction

function! UnComment () range
  exec 'silent ' . a:firstline . ',' . a:lastline . 's/^\(\s*\)' . GetCommentString () . ' /\1/e'
endfunction

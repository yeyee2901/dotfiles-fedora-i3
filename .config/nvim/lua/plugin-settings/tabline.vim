" Choose separator of your choice. And make sure your
" terminal emulator can render it.
let s:separator = '  '

" To get buffer name and attach it to the tab
function SimpleTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr-1])
  let label = fnamemodify(name, ':t')

  return len(label) == 0 ? 'No-Name' : label
endfunction


" Iterate through all tabpage and give name
" according to SimpleTabLabel ret val
function SimpleTabline()
  let tabline = ''

  " Determine which tab is active.
  " If yes change the scheme to `Sel` (highlighted)
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let tabline .= '%#TabLineSel#'
    else
      let tabline .= '%#TabLine#'
    endif

    " get label
    let tabline .= ' %{SimpleTabLabel(' . (i + 1) . ')}'

    " Finally the separator
    let tabline .= s:separator
  endfor

  return tabline
endfunction

set tabline=%!SimpleTabline()

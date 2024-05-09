" vimline.vim: vimline for my vimrc
" Maintainer:  @mpbsd
" Version:     0.1

function! VimDisplayCurrentMode(mode) abort
  " MODE {{{
  let l:MODE = {
        \  'n'    : 'NORMAL',
        \  'no'   : 'O-PENDING',
        \  'nov'  : 'O-PENDING',
        \  'noV'  : 'O-PENDING',
        \  'no\22': 'O-PENDING',
        \  'niI'  : 'NORMAL',
        \  'niR'  : 'NORMAL',
        \  'niV'  : 'NORMAL',
        \  'nt'   : 'NORMAL',
        \  'v'    : 'VISUAL',
        \  'vs'   : 'VISUAL',
        \  'V'    : 'V-LINE',
        \  'Vs'   : 'V-LINE',
        \  '\22'  : 'V-BLOCK',
        \  '\22s' : 'V-BLOCK',
        \  's'    : 'SELECT',
        \  'S'    : 'S-LINE',
        \  '\19'  : 'S-BLOCK',
        \  'i'    : 'INSERT',
        \  'ic'   : 'INSERT',
        \  'ix'   : 'INSERT',
        \  'R'    : 'REPLACE',
        \  'Rc'   : 'REPLACE',
        \  'Rx'   : 'REPLACE',
        \  'Rv'   : 'V-REPLACE',
        \  'Rvc'  : 'V-REPLACE',
        \  'Rvx'  : 'V-REPLACE',
        \  'c'    : 'COMMAND',
        \  'cv'   : 'EX',
        \  'ce'   : 'EX',
        \  'r'    : 'REPLACE',
        \  'rm'   : 'MORE',
        \  'r?'   : 'CONFIRM',
        \  '!'    : 'SHELL',
        \  't'    : 'TERMINAL',
        \}
  " }}}
  if has_key(l:MODE, a:mode)
    return l:MODE[a:mode]
  endif
endfunction

function! VimSetMyStatusline() abort
  let l:components = [
        \  '[%n]',
        \  '%{VimDisplayCurrentMode(mode())}',
        \  '%t',
        \  '%m',
        \  '%=',
        \  '%{&fileencoding}',
        \  '%{&fileformat}',
        \  '%Y',
        \  '%P',
        \  '%06l:%06c'
        \]
  return join(l:components)
endfunction

set statusline=%!VimSetMyStatusline()

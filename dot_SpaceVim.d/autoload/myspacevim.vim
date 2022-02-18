func! myspacevim#before() abort
  let g:hardtime_default_on = 1
  let g:hardtime_maxcount = 3
  let g:hardtime_allow_different_key = 1
  let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]
  let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
endf

func! myspacevim#after() abort
endf

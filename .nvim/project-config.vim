" source this file in vim to check for a local vim config before starting vim

function! SourceProjectInit()
  let l:project_init_path = getcwd() . '/.nvim/init.vim'

  if filereadable(l:project_init_path)
    execute 'source ' . l:project_init_path
  endif
endfunction

call SourceProjectInit()

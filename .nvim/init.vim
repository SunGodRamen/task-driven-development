"   Display a welcome message when Neovim is opened and the file is loaded
autocmd VimEnter * echo "Welcome to the task realm"

"   Open the architecture diagram from nvim
" command! Drawio !start "C:\Program Files\draw.io\draw.io.exe" %:p:h/drawio.html
command! Drawio !open -a "draw.io" %:p:h/drawio.html
" command! Drawio !drawio %:p:h/drawio.html

"   Default nvim commands for project template
" Add a command to create a new Taskwarrior task
vim.cmd("command! TaskNew !taskp add")
  
" Add a command to open the Taskwarrior task list
vim.cmd("command! TaskList !taskp list")
  
" Add a command to open the Draw.io diagram with the default system application
vim.cmd("command! DrawioOpen !xdg-open .drawio/diagram.drawio.html")
  
" Add a command to stage the changes to the Draw.io diagram
vim.cmd("command! DrawioStage !git add .drawio/diagram.drawio.html")
  
" Add a command to stage the changes to the Taskwarrior data files
vim.cmd("command! TaskStage !git add .task/*.data")
  
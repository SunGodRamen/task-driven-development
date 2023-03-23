"   Display a welcome message when Neovim is opened and the file is loaded
autocmd VimEnter * echo "Welcome to the task realm"

"   Open the architecture diagram from nvim
" command! Drawio !start "C:\Program Files\draw.io\draw.io.exe" %:p:h/drawio.html
command! Drawio !open -a "draw.io" %:p:h/drawio.html
" command! Drawio !drawio %:p:h/drawio.html


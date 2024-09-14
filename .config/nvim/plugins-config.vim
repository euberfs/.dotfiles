function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction
nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

"========================================================
" Theme
"========================================================
"colorscheme gruvbox
colorscheme nord
"colorscheme dracula


"========================================================
" Autocmd
"========================================================

"function! HighlightWordUnderCursor()
"    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
"        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
"    else
"        match none
"    endif
"endfunction
"
"autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()


"========================================================
" Airline
"========================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_statusline_ontop=1

" themes
"let g:airline_theme='gruvbox'
let g:airline_theme='nord'
"let g:airline_theme='dracula'

"========================================================
" Ale
"========================================================

let g:ale_linters = {
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1


"========================================================
"  limelight | Goyo
"========================================================

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
"autocmd VimEnter * Limelight " Start Limelight and leave the cursor in it
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader><ENTER> :Goyo<CR>


"========================================================
"   FZF
"========================================================

nnoremap <leader>f :FZF<CR>


"========================================================
"   NERDTree
"========================================================

" autocmd VimEnter * NERDTree " Start NERDTree and leave the cursor in it
nnoremap <C-t> :NERDTreeToggle<CR>a
let NERDTreeShowHidden=1

"========================================================
"   Instant Markdown
"========================================================

let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

nnoremap <C-p> :InstantMarkdownPreview<CR>


let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]

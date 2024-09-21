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
"colorscheme nord
"colorscheme dracula
color sonokai

"========================================================
" vim-pencil
"========================================================

" Enable the Pencil plugin
let g:pencil#wrap_mode = 'hard'            " Options: 'hard' or 'soft'
let g:pencil#textwidth = 80                 " Set the text width
let g:pencil#auto_indent = 1                 " Enable auto-indentation
let g:pencil#ignore_filetypes = ['markdown', 'text'] " Filetypes to ignore
let g:pencil#format_on_save = 1              " Auto-format on save
let g:pencil#fill_char = ' '                  " Character for filling

" Key mappings for vim-pencil
nnoremap <leader>p :Pencil<CR>               " Toggle Pencil mode

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
"let g:airline_theme='nord'
"let g:airline_theme='dracula'
let g:airline_theme = 'pencil'

"========================================================
" Ditto
"========================================================
" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn Ditto on and off

" If you don't want the autocmds, you can also use an operator to check
" specific parts of your text:
" vmap <leader>d <Plug>Ditto	       " Call Ditto on visual selection
" nmap <leader>d <Plug>Ditto	       " Call Ditto on operator movement

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

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
"nnoremap <leader><ENTER> :Goyo<CR>
autocmd VimEnter * Goyo|Limelight

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

" Install vim-plug if not found
"==================================
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" Run PlugInstall if there are missing plugins
"==================================
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Automatic installation
"==================================
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.config/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif




call plug#begin()

        "Plug 'morhetz/gruvbox'
        "Plug 'arcticicestudio/nord-vim'
        "Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'sainnhe/sonokai'

        Plug 'vimwiki/vimwiki'
        Plug 'preservim/nerdtree'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/limelight.vim'
        Plug 'makerj/vim-pdf'
        Plug 'instant-markdown/vim-instant-markdown', {'for': ['markdown', 'markdown.pandoc']}
        Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
        Plug 'dbmrq/vim-ditto'
        Plug 'preservim/vim-pencil'
        Plug 'preservim/vim-colors-pencil'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
        Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'} " mru and stuff
        Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'} " color highlighting 
call plug#end()

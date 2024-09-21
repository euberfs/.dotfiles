set autoread         " Update vim after file update from outside
set cmdheight=2      " Give more space for displaying messages
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set encoding=utf-8   " Use an encoding that supports unicode.
set expandtab        " Convert tabs to spaces.
set hidden           " Hide files in the background instead of closing them.
set incsearch        " Incremental search that shows partial matches.
set ignorecase       " Ignore case when searching.
set mouse=a          " Enable mouse support
set nu               " Enable line numbers
set number           " Show line numbers on the sidebar.
set nobackup         " No backup files
set nowritebackup    " No backup files
set relativenumber   " Represents line number with respect to the cursor’s position
set smarttab         " Insert “tabstop” number of spaces when the “tab” key is pressed.
set smartindent      " Inserts one extra level of indentation in some cases
set smartcase        " Consider case if there is a upper case character
set signcolumn=yes   " Add a column on the left. Useful for linting
set softtabstop=4    " Show existing tab with 4 spaces width
set splitright       " Create the vertical splits to the right
set splitbelow       " Create the horizontal splits below
set signcolumn=yes   " Add a column on the left. Useful for linting
set scrolloff=8      " The number of screen lines to keep above and below the cursor.
set shiftwidth=4     " When shifting, indent using four spaces.
set tabstop=4        " Show existing tab with 4 spaces width
set updatetime=100   " Time in miliseconds to consider the changes
set termguicolors
syntax enable            " Enable syntax highlight
set noreadonly
set clipboard=unnamedplus " Clipboard
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
filetype indent on   " Enable indentation rules that are file-type specific.


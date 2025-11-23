" Change cursor shape by mode
let &t_SI = "\e[6 q"  " Insert mode - bar
let &t_EI = "\e[2 q"  " Normal mode - block
let &t_SR = "\e[4 q"  " Replace mode - underline

" make upper case variants behave as normal lower case command
cabbr Wq wq
cabbr W w
cabbr Q q

" keep 10 lines above/below cursor
set scrolloff=10               

" Allow mouse interaction 
"  Good if clipboard is integrated with the system, 
"  otherwise I prefer to keep it off, so I can select and copy to system clipboard using terminal mouse selection
"set mouse=a

" Highlight cursor column
set cursorline

" Security
"   example: # vim: set modeline | !rm -rf ~ | set nomodeline:
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" enable line wrapping
set wrap

" Better line wrapping
set linebreak
set breakindent
set showbreak=↪\ 

" controls how Vim formats text
"   t: auto-wrap,
"   c: comments
"   q: allow formatting comments
"   r: auto-insert comment leader
"   n: recognize numbered lists
"   1: don't break lines after a one-letter word
set formatoptions=tcqrn1

set textwidth=79

" Map tabs to space
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround

" Rendering
set ttyfast

" show current mode and command
set showmode
set showcmd

" Show matching brackets briefly
set matchtime=2

" Split close to current window
set splitbelow
set splitright

" Allow switching buffers with unsaved changes
set hidden

" Always show sign column (prevents text shifting)
set signcolumn=yes

" Enhanced wildmenu for command-line completion
set wildmenu
set wildmode=longest:full,full
set wildignorecase

" Search down into subfolders (for :find command)
set path+=**

" Case-insensitive filename completion
set fileignorecase

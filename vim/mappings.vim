" Space as leader key
let mapleader = " "

" Move up/down editor lines, useful when lines wrap
nnoremap j gj
nnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj

" Searching
" insert mode: search with very magic regex by default
nnoremap / /\v
" visual mode: search with very magic regex by default
vnoremap / /\v
set hlsearch    " highlight all matches
set incsearch   " show search matches while typing
set ignorecase  " case-insensitive
set smartcase   " if has uppercase, make search case-sensitive
set showmatch   " briefly jump to matching bracket while typing

" Clear search highlight with Esc in normal mode
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Keep cursor centered when searching
nnoremap n nzzzv
nnoremap N Nzzzv

" Formatting
map <leader>q gqip      " current paragraph
vnoremap <leader>q gq   " visually selected text

" Don't copy when pasting over selection in visual mode
vnoremap p "_dP

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR> " toggle tabs and EOL

" Cursor motion
set backspace=indent,eol,start  " backspace works like normal editors
set matchpairs+=<:>             " use % to jump between <> pairs, just like (), {}, []
runtime! macros/matchit.vim     " enable % to work between match keywords like if/endif

" Auto-pairs for brackets/quotes
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ` ``<Left>
inoremap ' ''<Left>
inoremap <expr> " '""'."\<Left>"

" Smart backspace over auto-pairs
inoremap <expr> <BS> <SID>smart_backspace()
function! s:smart_backspace()
    let col = col('.') - 1
    let before = getline('.')[col - 1]
    let after = getline('.')[col]
    let pairs = {'(': ')', '[': ']', '{': '}', "'": "'", '"': '"', '`': '`'}
    if has_key(pairs, before) && pairs[before] == after
        return "\<Del>\<BS>"
    else
        return "\<BS>"
    endif
endfunction

" Show buffer list and prompt for switch
nnoremap <leader>b :ls<CR>:b<Space>

" Close all buffers except current
command! BufOnly silent! execute "%bd|e#|bd#"
nnoremap <leader>bo :BufOnly<CR>

" Window split
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>


" ---


" Forbidden shortcuts that make vim people cry

" Ctrl+S to save (works in normal and insert mode)
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>gv

" Ctrl+Q to close buffer
nnoremap <C-q> :bd<CR>
inoremap <C-q> <Esc>:bd<CR>

" Ctrl+D to duplicate line
nnoremap <C-d> :t.<CR>
inoremap <C-d> <Esc>:t.<CR>a
vnoremap <C-d> :t'><CR>gv

" Alt+Up/Down to move lines
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-Down> :m .+1<CR>==
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

" Ctrl+PageUp/PageDown for buffer navigation
nnoremap <C-PageUp> :bprevious<CR>
nnoremap <C-PageDown> :bnext<CR>
inoremap <C-PageUp> <Esc>:bprevious<CR>
inoremap <C-PageDown> <Esc>:bnext<CR>

" Ctrl+Arrow keys for word navigation
nnoremap <C-Right> w
nnoremap <C-Left> b
inoremap <C-Right> <Esc>wa
inoremap <C-Left> <Esc>bi
vnoremap <C-Right> e
vnoremap <C-Left> b

" PageUp/PageDown for half-page scrolling
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>
inoremap <PageUp> <C-o><C-u>
inoremap <PageDown> <C-o><C-d>
vnoremap <PageUp> <C-u>
vnoremap <PageDown> <C-d>

" Ctrl+Home/End for file start/end
nnoremap <C-Home> gg
nnoremap <C-End> G
inoremap <C-Home> <Esc>ggi
inoremap <C-End> <Esc>Gi
vnoremap <C-Home> gg
vnoremap <C-End> G

" Ctrl+A to select all
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG

" Tab/Shift+Tab for indent/unindent in visual mode
noremap <Tab> >gv
vnoremap <S-Tab> <gv

" Open file explorer, with vertical split, in current file's directory
nnoremap <C-o> :Lexplore %:p:h<CR>

" Map Alt+Left to jump back
nnoremap <A-Left> <C-o>
inoremap <A-Left> <C-o>

" Map Alt+Right to jump forward
nnoremap <A-Right> <C-i>
inoremap <A-Right> <C-i>

" Window navigation
nnoremap <C-w><left> <C-w>h
nnoremap <C-w><down> <C-w>j
nnoremap <C-w><up> <C-w>k
nnoremap <C-w><right> <C-w>l

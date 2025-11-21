" Keep undo history between sessions
set undofile
set undolevels=100
set undoreload=10000

" Organize backup/swap/undo files
set backupdir=~/.cache/vim/backup//
set directory=~/.cache/vim/swap//
set undodir=~/.cache/vim/undo//

" Create directories if they don't exist
if !isdirectory($HOME."/.cache/vim/backup")
    call mkdir($HOME."/.cache/vim/backup", "p", 0700)
endif
if !isdirectory($HOME."/.cache/vim/swap")
    call mkdir($HOME."/.cache/vim/swap", "p", 0700)
endif
if !isdirectory($HOME."/.cache/vim/undo")
    call mkdir($HOME."/.cache/vim/undo", "p", 0700)
endif

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
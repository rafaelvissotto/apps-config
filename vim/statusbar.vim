" Custom statusline (shows mode, file, position, percentage)
set statusline=%#StatusLine#
set statusline+=\ %{toupper(mode())}                     " Mode
set statusline+=\ %*                                     " Reset color
set statusline+=\ %f                                     " File path
set statusline+=%m                                       " Modified flag
set statusline+=%r                                       " Readonly flag
set statusline+=%=                                       " Right align
set statusline+=%{&fileencoding?&fileencoding:&encoding} " Encoding
set statusline+=\ %y                                     " File type
set statusline+=\ %l:%c                                  " Line:Column
set statusline+=\ %p%%                                   " Percentage
set statusline+=\ 

" Status bar, 2 = always show
set laststatus=2
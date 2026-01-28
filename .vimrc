" ===== SETUP AND KEYMAPS =====
set number          " Enable line numbers
set cursorline      " Hightlight working line
set autoindent      " Enable auto indentation
set expandtab       " Convert tabs to spaces
set tabstop=2       " Tabs width
set shiftwidth=2    " Indentation width
set list            " Show special characters
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•
set mouse=a         " Enable mouse

" Colours
highlight LineNr ctermfg=White
highlight CursorLine cterm=NONE ctermbg=DarkGrey
highlight CursorLineNr cterm= NONE ctermfg=White ctermbg=DarkBlue

" Navigate tabs with Alt+arrow
nnoremap <A-left> :tabprevious<CR>
nnoremap <A-right> :tabnext<CR>

" Navigating splits with Alt+hjkl
nnoremap <A-j> <C-W><C-J>
nnoremap <A-k> <C-W><C-K>
nnoremap <A-l> <C-W><C-L>
nnoremap <A-h> <C-W><C-H>

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" ===== LEFT:
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=\ %y

" ===== RIGHT:
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ [%l,%c]
set statusline+=\ %l/%L(%p)

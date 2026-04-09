" Setup
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
highlight LineNr ctermfg=LightGrey
highlight CursorLine cterm=NONE ctermbg=Black
highlight CursorLineNr cterm=bold ctermbg=DarkBlue ctermfg=White
highlight StatLineCmd cterm=NONE ctermbg=DarkGrey ctermfg=White
highlight StatLineIns cterm=NONE ctermbg=DarkGreen ctermfg=White
highlight link StatLineColour StatLineCmd

autocmd InsertLeave * highlight link StatLineColour StatLineCmd
autocmd InsertEnter * highlight link StatLineColour StatLineIns

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" ===== Status line config =====
set laststatus=2                  " Show status line
set statusline=%#StatLineColour#  " Set colours
set statusline+=\ %F\ %y%m%r      " Filename, filetype, modified, read only
set statusline+=%=                " Switch side
set statusline+=\ %p%%\ [%l,%c]   " Percentage [line,column]

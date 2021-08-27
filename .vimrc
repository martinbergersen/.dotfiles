" Location: ~/.vimrc

" ===== SETUP AND KEYMAPS =====
set number          " Enable line numbers
set autoindent      " Enable auto indentation
set expandtab       " Convert tabs to spaces
set tabstop=2       " Tabs width
set shiftwidth=2    " Indentation width
"set list            " Show special characters
"set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•
set mouse=a         " Enable mouse

" Navigate tabs with Alt+arrow
nnoremap <A-left> :tabprevious<CR>
nnoremap <A-right> :tabnext<CR>

" Navigating splits with Alt+HJKL
nnoremap <A-J> <C-W><C-J>
nnoremap <A-K> <C-W><C-K>
nnoremap <A-L> <C-W><C-L>
nnoremap <A-H> <C-W><C-H>

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" ===== STATUSLINE CONFIG =====
set laststatus=2
set statusline=

" GIT branch funtions:

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" ===== LEFT:
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=\ %y

" ===== RIGHT:
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ [%l,%c]
" set statusline+=\ %l/%L(%p)

" ===== PLUGINS =====
" vim-plug: https://github.com/junegunn/vim-plug
" Run :PlugInstall to install

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
"Plug 'scrooloose/nerdtree'
"Plug 'shinchu/lightline-gruvbox.vim'
"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'arcticicestudio/nord-vim', { 'as': 'nord' } " Nord
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula
Plug 'ghifarit53/tokyonight-vim'
Plug 'ntk148v/vim-horizon'

call plug#end()

" ===== COLORS =====
"hi Normal ctermfg=252 ctermbg=none
"set t_Co=256
"set termguicolors
"set background=dark
"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 1
colorscheme nord

" ===== LIGHTLINE CONFIG =====
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'helloworld', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch':'gitbranch#name'
      \ },
      \ }

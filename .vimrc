" Location: ~/.vimrc

" Set color scheme
colorscheme nord
set background=dark
"set termguicolors
hi Normal ctermfg=252 ctermbg=none

" Enable linenumbers
set number

" Set encryption to blowfish
set cm=blowfish2

"----------------------------------------
" STATUSLINE
set laststatus=2
set statusline=
"hi StatusLine ctermbg=148
"hi StatusLine ctermfg=

" GIT branch funtions:

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" Left side:
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %F
set statusline+=\ %y

"Right side:
set statusline+=%=
set statusline+=\ %p%%
set statusline+=\ [%l,%c]
" set statusline+=\ %l/%L(%p)
"----------------------------------------

" Set [TAB] = 2 spaces
set tabstop=2
set shiftwidth=4
set expandtab

" Show whitespaces
set list
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•

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

"================== PLUGINS:
" vim-plug: https://github.com/junegunn/vim-plug
" Run :PlugInstall to install

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
"Plug 'scrooloose/nerdtree'
"Plug 'shinchu/lightline-gruvbox.vim'
"Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'arcticicestudio/nord-vim'   " Nord color scheme

call plug#end()

" Lightline config
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

set ai
set et

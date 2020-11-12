" Location: ~/.vimrc

" Set color scheme
" set t_ut=
" colors nord
set bg=dark
hi Normal ctermfg=252 ctermbg=none

" Enable linenumbers
set number

"----------------------------------------
" STATUSLINE
set laststatus=2
set statusline=
hi StatusLine ctermbg=148
" hi StatusLine ctermfg=

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

" Navigate tabs with Alt+arrow
nnoremap <A-left> :tabprevious<CR>
nnoremap <A-right> :tabnext<CR>

" Enable folding with spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Set encoding
" set encoding=utf-8

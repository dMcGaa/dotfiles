set nocp
execute pathogen#infect()
syntax on
filetype plugin indent on


let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set listchars=eol:¬
set list

filetype plugin indent on
" show existing tab with 2 spaces width
 set tabstop=2
 " when indenting with '>', use 2 spaces width
 set shiftwidth=2
 " On pressing tab, insert 4 spaces
 set expandtab

" set color
colorscheme delek

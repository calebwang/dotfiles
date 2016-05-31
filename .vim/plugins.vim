
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
let g:ackprg = 'ag --vimgrep'
Plugin 'mileszs/ack.vim'
let g:ctrlp_max_files=0
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
let g:tsuquyomi_disable_quickfix = 1
Plugin 'Quramy/tsuquyomi'

call vundle#end()


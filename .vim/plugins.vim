
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

let g:ackprg = 'ag --vimgrep'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
let g:tsuquyomi_disable_quickfix = 1
Plugin 'Quramy/tsuquyomi'

call vundle#end()


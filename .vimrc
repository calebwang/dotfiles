" Plugins
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
source ~/.vim/plugins.vim
filetype plugin indent on

set number
set ruler

set ts=4
set sw=4
set sts=4
set et

map <C-l> <C-w>l 
map <C-h> <C-w>h 
map <C-j> <C-w>j 
map <C-k> <C-w>k 

map ∆ gT
map ˚ gt

syntax on
colorscheme monokai
colorscheme molokai

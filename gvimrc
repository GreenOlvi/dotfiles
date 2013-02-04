set guioptions=aegimrLt
if has('unix')
   set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
endif

set lines=42
set columns=130

let g:lucius_style = 'light' " Light on GUI
colorscheme lucius

:menu &MyVim.Current\ File.Convert\ Format.To\ Dos :set fileformat=dos<cr> :w<cr>
:menu &MyVim.Current\ File.Convert\ Format.To\ Unix :set fileformat=unix<cr> :w<cr>
:menu &MyVim.Current\ File.Remove\ Trailing\ Spaces\ and\ Tabs :%s/[  ]*$//g<cr>
:menu &MyVim.Current\ File.Remove\ Ctrl-M :%s/^M//g<cr>
:menu &MyVim.Current\ File.Remove\ All\ Tabs :retab<cr>
:menu &MyVim.Current\ File.To\ HTML :runtime! syntax/2html.vim<cr>

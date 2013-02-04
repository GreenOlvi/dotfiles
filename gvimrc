set guioptions=a  " Set autoselect
set guioptions+=c " Use console dialogs instead of popup dialogs
set guioptions+=e " Add tab pages
set guioptions+=i " Use a Vim icon
set guioptions+=m " Show menu bar
set guioptions+=g " Grey out inactive menu items
set guioptions+=r " Always show right scrollbar
set guioptions+=t " Include tearoff menu items

if has('unix')
   set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
endif

set lines=42
set columns=130

let g:lucius_style = 'light' " Light on GUI
colorscheme lucius

:menu &MyVim.Current\ File.Convert\ Format.To\ Dos :set fileformat=dos<cr> :w<cr>
:menu &MyVim.Current\ File.Convert\ Format.To\ Unix :set fileformat=unix<cr> :w<cr>
:menu &MyVim.Current\ File.To\ HTML :runtime! syntax/2html.vim<cr>

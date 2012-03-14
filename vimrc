set backspace=2
set winheight=999
set virtualedit=block
set number
set ruler

syntax on

" Tab options
set tabstop=3
set shiftwidth=3
set expandtab

" Easy window switching
imap <C-w> <C-o><C-w>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

map <F6> :set list!<Bar>set list?<CR>
map <F7> :%s/\s\+$//<CR>
map <F8> :Tlist<CR>
map <F9> :set wrap!<Bar>set wrap?<CR>
map <F10> :set paste!<Bar>set paste?<CR>
map <F11> :set hls!<Bar>set hls?<CR>
"map <F12> :set number!<Bar>set number?<CR>

command! W w
command! Q q

nnoremap Y y$

" Save with sudo
cmap w!! %!sudo tee > /dev/null %

" Easy .vimrc edit and source
if has("unix")
   nmap <leader>src :source $HOME/.vimrc<CR>
   nmap <leader>erc :sp $HOME/.vimrc<CR>
else
   nmap <leader>src :source $VIM/_gvimrc<CR>
   nmap <leader>erc :sp $VIM/_gvimrc<CR>
endif

" Perl syntax check with make
autocmd BufNewFile,BufRead *.p? compiler perl

map <C-P> :Perldoc<cword><CR>
autocmd BufNewFile,BufRead *.p? setf perl
autocmd BufNewFile,BufRead *.p? map <C-P> :Perldoc<cword><CR>
autocmd BufNewFile,BufRead *.p? let g:perldoc_program='/usr/bin/perldoc'
autocmd BufNewFile,BufRead *.p? source $HOME/.vim/ftplugin/perl_doc.vim

" Perl test files
autocmd BufNewFile,BufRead *.t setf perl
autocmd BufNewFile,BufRead *.t map <F5> :!./Build test test-files=% verbose=1<CR>

" Toolkit template syntax
autocmd BufNewFile,BufRead *.tt setf tt2html

set modeline
 
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.*/
 
" ?
"autocmd BufRead mutt-* source $HOME/.vim/modes/mail.vim

" Run perltidy
fun! Pretty ()
   execute '%!perltidy -q'
endfun

nmap <silent> <C-f> <Esc> :call Pretty()<CR>

" Toggle line numbers
function! NumberToggle()
   if(&number == 1)
      set relativenumber
   else
      if(&relativenumber == 1)
         set norelativenumber
      else
         set number
      endif
   endif
endfunc

map <F12> :call NumberToggle()<Bar>set number?<CR>


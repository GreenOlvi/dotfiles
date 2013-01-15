set nocompatible

call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin on
filetype indent on

let mapleader=","

set backspace=indent,eol,start
set encoding=utf-8
set incsearch                    " Highlight search while typing
set modeline
set number
set ruler
set smartindent                  " Smart autoindenting when starting a new line
set splitbelow                   " Open new split below
set t_Co=256                     " Explicitly tell vim that the terminal supports 256 colors
set virtualedit=block
set winheight=999

" Disable swapfiles and backup
set nobackup
set noswapfile

" Tab-completion in command line mode
set wildmode=list:longest

" Very Mac-ish ;)
let g:lucius_style = 'dark'
colorscheme lucius

" Use mouse
if has('mouse')
   set mouse=a
endif

" Tab options
set tabstop=3
set shiftwidth=3
set softtabstop=3
set expandtab

" Stop using arrow keys!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy window switching
imap <C-w> <C-o><C-w>
map <C-J> <C-W>j<C-w>_
map <C-K> <C-W>k<C-w>_
map <C-H> <C-W>h<C-w>_
map <C-L> <C-W>l<C-w>_
map <C-_> <C-W>_

map <F6> :set list!<Bar>set list?<CR>
map <F7> :GundoToggle<CR>
map <F8> :Tlist<CR>
map <F9> :set wrap!<Bar>set wrap?<CR>
map <F10> :set paste!<Bar>set paste?<CR>
map <F11> :set hls!<Bar>set hls?<CR>

" Quick divide line
nmap <silent> <leader><CR> i<CR><ESC>

" Disable annoying switching to ex mode
nnoremap Q <nop>

" Easy begin and end of line
nnoremap H 0
nnoremap L $

" Y to yank to the end of the line
nnoremap Y y$

command! W w
command! Q q

" Save with sudo
cmap w!! %!sudo tee > /dev/null %

" Easy .vimrc edit and source
nmap <leader>erc :sp $MYVIMRC<CR>
nmap <leader>src :source $MYVIMRC<CR>

if has("unix")
   " Simple session handling
   nmap <leader>ss :wa<CR>:mksession! $HOME/.vim/sessions/
   nmap <leader>so :wa<CR>:so $HOME/.vim/sessions/
else  " Windows version
   nmap <leader>ss :wa<CR>:mksession! $VIM/sessions/
   nmap <leader>so :wa<CR>:so $VIM/sessions/
endif

" Always show status line
set laststatus=2

" Status line with git status (overriden by Powerline)
" set statusline=%{fugitive#statusline()}\ %<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P

" Perl syntax check with make
autocmd BufNewFile,BufRead *.p? compiler perl

" Perl test files (assumes vim is running from project root)
autocmd BufNewFile,BufRead *.t setf perl
autocmd BufNewFile,BufRead *.t map <buffer> <F5> :!./Build test test-files=% verbose=1<CR>

" Toolkit template syntax
autocmd BufNewFile,BufRead *.tt setf tt2html

" Embedded perl templates syntax
autocmd BufNewFile,BufRead *.ep setf html

" Auto remove trailing whitespaces
autocmd BufWritePre *.pl,*.pm,*.t,*.tt,*.ep :%s/\s\+$//e

"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.*/
 
" Run perltidy
fun! Pretty ()
   execute '%!perltidy -q'
endfun

autocmd BufNewFile,BufRead *.p? nmap <silent> <C-g> <Esc> :call Pretty()<CR>

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

map <F3> :call NumberToggle()<Bar>set number?<CR>

" Shows name of function or subroutine
function! FindSub()
   let subpattern = '\(sub\|function\) \w\+'
   let subline = search(subpattern, 'bnW')
   if !subline
      return 'not in sub'
   else
      return matchstr(getline(subline), subpattern)
   endif
endfunction

" use aesthetic middle of screen for "zz"
nnoremap <silent> zz :exec "normal! zz" . float2nr(winheight(0)*0.1) . "\<Lt>C-E>"<CR>


" CtrlP settings
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
   \ 'dir':  '\v[\/](\.(git|hg|svn))|(blib)$',
   \ 'file': '\v\.sw[a-z]$',
   \ }

" Powerline settings
let g:Powerline_symbols = 'fancy'

" Vim Pipe settings
autocmd BufNewFile,BufRead *.t let b:vimpipe_command="./Build test --test-files=% --verbose 2>&1"
autocmd BufNewFile,BufRead *.t let b:vimpipe_filetype="tap"


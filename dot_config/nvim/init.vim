call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>

Plug 'hashivim/vim-terraform'
let g:terraform_align=1
let g:terraform_fmt_on_save=1

Plug 'tpope/vim-sleuth'

Plug 'airblade/vim-gitgutter'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'connorholyday/vim-snazzy'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-p> :Files<Cr>

Plug 'elzr/vim-json'
" Disable goofy-ass quote hiding
let g:vim_json_syntax_conceal = 0

call plug#end()

" Always use relative line numbers
set relativenumber
au BufRead,BufNewFile,BufWinEnter * set relativenumber

set background=dark
set mouse=a

" Integrate with OS X clipboard
set clipboard=unnamed

" Make the gutter match the background color
highlight clear SignColumn


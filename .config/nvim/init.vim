"   Autoload Vim-Plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"   Vim-Plug
call plug#begin()
    Plug 'KevinGoodsell/vim-csexact'
    Plug 'sjl/badwolf'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mbbill/undotree'
    Plug 'sgur/vim-editorconfig'
    Plug 'tpope/vim-repeat'
    Plug 'junegunn/vim-easy-align'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim'
    Plug 'neomake/neomake'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-unimpaired'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()

let g:csexact_term_override = 'xterm-termite'
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_cpp_gcc_maker = {
\ 'exe': 'g++',
\ 'args': ['-Wall', '-Iinclude', '-Wextra', '-Weverything', '-pedantic', '-Wno-sign-conversion'],
\ }

"   Polyglot
let g:jsx_ext_required = 1

"   Vim-Latex-Preview
let g:livepreview_previewer = 'zathura'

"   Airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat =
    \ '!|defx|diff|gundo|undo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#whitespace#mixed_indent_algo = 2

"   NerdTree
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMinimalUI=1

"   Leader Bindings
let mapleader="\<space>"
nnoremap <leader>j :bprev<CR>
nnoremap <leader>k :bnext<CR>
nnoremap <leader>i <C-^>
nnoremap <leader>X :bd!<CR>
nnoremap <leader>x :b#<bar>bd!#<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>= :so $MYVIMRC<CR>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>s :terminal<CR>
nnoremap <leader>n :silent !dos2unix '%'<CR>:e<CR>
nnoremap <leader>c :silent !firefox '%'<CR>
nnoremap <leader>p :let @+=expand("%")<CR>
nnoremap <leader>P :let @+=expand("%:p")<CR>
nnoremap <leader>m :Neomake<CR>
nnoremap <leader>M :NeomakeClean<CR>
nnoremap <leader><tab> :Files<CR>
nnoremap <leader>b :Buffers<CR>

"   EasyAlign
xmap <leader>e <Plug>(EasyAlign)
nmap <leader>e <Plug>(EasyAlign)

"   Reverse
vnoremap <leader>r c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

"   Window Navigation
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

"   Terminal Window Bindings
tnoremap <Esc> <C-\><C-n>

"   Move through visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"   Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"   Save and quit (requires x-term keys)
nnoremap <C-S> :w!<CR>
nnoremap <C-Q> :q!<CR>

"   UI Config
colorscheme badwolf
set number
set relativenumber
set shortmess+=I
set noshowmode

"   Why does neovim line-number terminals by default?
au TermOpen * setlocal nonumber norelativenumber

"   Editing Config
set wrap
set linebreak
set updatetime=5000000

"   System Config
set ignorecase
set smartcase
set clipboard=unnamedplus
set noswapfile
set mouse=a
set timeoutlen=1000 ttimeoutlen=0
set ffs=unix
set hidden

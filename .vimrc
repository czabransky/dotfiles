syntax on
let mapleader = "\<SPACE>"
let maplocalleader = "\<SPACE>"
set breakindent
set cursorline
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
set history=1000
set ignorecase smartcase
set incsearch
set nobackup
set nohlsearch
set noswapfile
set nowrap
set number
set mouse=a
set relativenumber
set scrolloff=8
set shiftwidth=4
set showmode
set signcolumn
set smartcase
set smartindent
set softtabstop=4
set tabstop=4
set termguicolors
set timeout
set timeoutlen=500
set updatetime=50

if !isdirectory($HOME.'/.vim')
	call mkdir($HOME.'/.vim', '', 0770)
endif
if !isdirectory($HOME.'/.vim/undodir')
	call mkdir($HOME.'/.vim/undodir', '', 0770)
endif

set undodir=~/.vim/undodir
set undofile

" Windows
nmap <leader>w/ :vsplit<CR>
nmap <leader>w- :split<CR>
nmap <CR> :write<CR>
nnoremap <leader>w, :vertical resize -10<CR>
nnoremap <leader>w. :vertical resize +10<CR>
nnoremap <leader>' <C-^>

" Best Remaps of All Time
nnoremap gg ggzz
nnoremap G Gzz
nnoremap <C-u> <C-u>z z
nnoremap <C-d> <C-d>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nmap Q gq
imap jj <Esc>
imap jk <Esc>
nnoremap Y y$
xnoremap <leader>p "_dP
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>Y "+Y
vmap <leader>Y "+Y
nmap gp '[v']
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Misc Mappings
nnoremap <leader>S :%s//g<Left><Left>
xnoremap <leader>S :s/\%V/g<Left><Left>

" Plugin Globals
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

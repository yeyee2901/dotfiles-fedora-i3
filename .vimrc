" ░░░█░█░░░▀█▀░░░█▄█░░
" ░░░▀▄▀░░░░█░░░░█░█░░
" ░░░░▀░░░░▀▀▀░░░▀░▀░░
" ░░░█▄█░▀█▀░█▀█░▀█▀░█▄█░█░█░█▄█░░
" ░░░█░█░░█░░█░█░░█░░█░█░█░█░█░█░░
" ░░░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░▀▀▀░▀░▀░░
" ░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░
" ░░░█░░░█░█░█░█░█▀▀░░█░░█░█░░
" ░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░
" yeyee2901 - 2021

" BASIC SETTINGS -------------------------------
filetype indent plugin on
syntax on
set encoding=utf8
set number
set clipboard=unnamedplus
set mouse=a
set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set nowrap
set ignorecase
set timeout 
set timeoutlen=2000
set nohlsearch
set hidden
set splitbelow
set splitright

" KEYBINDINGS --------------------------------
" Leader key
nnoremap <SPACE> <NOP>
let g:mapleader=' '
let g:maplocalleader=' '

" Toggle search highlighting
nnoremap <S-h> <cmd>set hl<CR>

" Make <S-y> behave the same as <S-d> & <S-c>
nnoremap <S-y> y$

" Visual Mode ---------------
vnoremap <silent> <Tab> >gv
vnoremap <silent> <S-Tab> <gv
vnoremap <silent> <BS> xgv

" Window Keymappings --------
" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" splits
nnoremap sv <C-w>v
nnoremap sh <C-w>h
nnoremap sq <C-w>q
nnoremap sr <C-w><C-r>


" Tab Keymappings -----------
nnoremap <Tab>n :tabnew<CR>
nnoremap <Tab>q :tabclose<CR>
nnoremap <Tab>l :tabnext<CR>
nnoremap <Tab>h :tabprevious<CR>


" AUTOCOMMANDS ----------------------------------
augroup CIndentation
    autocmd!
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set tabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set softtabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set shiftwidth=2
augroup END

" OTHER SETUPS ----------------------------------
" Background
if has('termguicolors')
    " Transparent
    hi Normal guibg=NONE
    hi LineNr guibg=NONE
    hi SignColumn guibg=NONE
end

"File explorer -------------
nnoremap <Leader>n :Lexplore<CR>

" Tree-style
let g:netrw_liststyle=3

" Ga perlu lebar-lebar(size in %)
let g:netrw_winsize=20

" Terminal ------------------
nnoremap <Leader>t :terminal<CR>

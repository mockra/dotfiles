set shell=bash
scriptencoding utf-8
set encoding=utf-8
set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'dockyard/vim-easydir'
Plug 'godlygeek/tabular'

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-rails'

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'janko-m/vim-test'
Plug 'bswinnerton/vim-test-github'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
call plug#end()

let g:ruby_path = '/Users/mockra/.rbenv/shims/ruby'
let g:ruby_indent_access_modifier_style = 'outdent'

let test#javascript#mocha#options = '-A --compilers js:babel-register'

let test#runners = {'Ruby': ['GitHub']}
let test#strategy = "vimux"

syntax on
set t_Co=256
set cc=+1
set cursorline

if (has("termguicolors"))
  set termguicolors
endif

set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set incsearch
set laststatus=2
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set hlsearch
set list listchars=tab:»·,trail:·
set lazyredraw
set relativenumber

set textwidth=109
set backspace=2
set ignorecase smartcase

set number
set numberwidth=5

set wildmode=list:longest,list:full
set complete=.,w,t
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*

imap jj <Esc>

au FileType gitcommit set tw=72
au BufRead,BufNewFile *.md,*.txt setlocal spell
au BufNewFile,BufRead *.md,*.txt setlocal wrap
au BufNewFile,BufRead *.md,*.txt setlocal lbr
au BufRead,BufNewFile *.pill setfiletype ruby
au FileType qf setlocal wrap linebreak

let g:html_indent_tags = 'li\|p'

nmap s <Plug>(easymotion-overwin-f)

map <leader>bi :!bundle install<cr>
map <leader>v :vsplit<cr>
map <leader>f :Ag<cr>
map <leader>a :A<cr>
map <leader>w :w<cr>
map <leader>g :%s/\<<C-r><C-w>\>/
map <leader>p :r !pbpaste<cr>
map <leader>D :call delete(expand('%')) \| bdelete!<cr>
map <leader>s :%sort<cr>
map <leader>y "*y<cr>
map <leader>q :q<cr>
map <leader>h :s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>
nnoremap <leader>yf :let @*=expand("%")<CR>

nmap <silent> <leader>t :w \| :TestNearest<CR>
nmap <silent> <leader>T :w \| :TestFile<CR>
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Wq! :wq!
nmap :WQ! :wq!

nnoremap <silent> go :Files<CR>
nnoremap <silent> gr :History<CR>

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:VimuxHeight = "10"
map <Leader>z :VimuxZoomRunner<CR>

let g:airline_theme='dracula'
let g:tmuxline_preset = 'nightly_fox'

autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

function! RenameFile()
 let old_name = expand('%')
 let new_name = input('New file name: ', expand('%'), 'file')
 if new_name != '' && new_name != old_name
   exec ':saveas ' . new_name
   exec ':silent !rm ' . old_name
   redraw!
 endif
endfunction
map <leader>n :call RenameFile()<cr>

function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>

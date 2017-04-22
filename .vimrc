set shell=bash
scriptencoding utf-8
set encoding=utf-8
set nocompatible
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'trevordmiller/nova-vim'

Plug 'ervandew/supertab'
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'dockyard/vim-easydir'
Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-rails'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'janko-m/vim-test'
Plug 'bswinnerton/vim-test-github'

Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'

Plug 'ludovicchabant/vim-gutentags'
call plug#end()

let g:ruby_path = '/Users/mockra/.rbenv/shims/ruby'
let g:ruby_indent_access_modifier_style = 'outdent'

let test#javascript#mocha#options = '-A --compilers js:babel-register'
let g:gutentags_cache_dir = '~/.tags_cache'

let test#runners = {'Ruby': ['GitHub']}
let test#strategy = "vimux"

colorscheme nova
syntax on
set t_Co=256
set cc=+1
set cursorline

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

set textwidth=79
set backspace=2
set ignorecase smartcase

set number
set numberwidth=5

set wildmode=list:longest,list:full
set complete=.,w,t
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*

au FileType gitcommit set tw=72
au BufRead,BufNewFile *.md,*.txt setlocal spell
au BufNewFile,BufRead *.md,*.txt setlocal wrap
au BufNewFile,BufRead *.md,*.txt setlocal lbr
au BufRead,BufNewFile *.pill setfiletype ruby
au FileType qf setlocal wrap linebreak

let g:html_indent_tags = 'li\|p'
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

:let g:ctrlp_match_window = 'min:4,max:15'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|yardoc)|bower_components|public|node_modules|_build|tmp|log|deps|priv\/static$',
  \ 'file': '\v\.(exe|so|dll|dat|DS_Store)$'
  \ }
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nmap s <Plug>(easymotion-overwin-f)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
nnoremap <leader>yf :let @*=expand("%")<CR>

nmap <silent> <leader>t :w \| :TestNearest<CR>
nmap <silent> <leader>T :w \| :TestFile<CR>
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Wq! :wq!
nmap :WQ! :wq!

nnoremap <silent> go :CtrlP<CR>
nnoremap <silent> gr :CtrlPMRU<CR>

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>

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

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

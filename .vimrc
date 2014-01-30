set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'digitaltoad/vim-jade'
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'VimClojure'
Bundle 'tpope/vim-surround'
Bundle 'fsouza/go.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle 'elzr/vim-json'
Bundle 'wavded/vim-stylus'
Bundle 'mockra/vim-vroom'
Bundle 'dockyard/vim-easydir'
Bundle 'tpope/vim-git'

filetype plugin indent on

let g:ruby_path = '/Users/mockra/.rbenv/shims/ruby'

set shell=/bin/bash

syntax on
set t_Co=256
set bg=light
set cc=80
set cursorline
hi CursorLine term=bold cterm=bold

set nocompatible
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

let g:html_indent_tags = 'li\|p'
let g:Powerline_symbols = 'fancy'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:vroom_rspec_format = 'documentation'

map <Leader>bi :!bundle install<cr>
map <leader>v :vsplit<cr>
map <leader>z :vertical resize +40<cr>
map <leader>x :vertical resize -40<cr>
map <leader>a :A<cr>
map <leader>w :w<cr>
map <leader>d <C-w><C-w>
map <Leader>g :%s/\<<C-r><C-w>\>/
map <leader>p :silent !open -a Marked.app '%:p'<cr>
map <leader>D :call delete(expand('%')) \| bdelete!<cr>
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Wq! :wq!
nmap :WQ! :wq!

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

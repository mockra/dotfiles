set shell=bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'digitaltoad/vim-jade'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'VimClojure'
Plugin 'tpope/vim-surround'
Plugin 'fsouza/go.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'elzr/vim-json'
Plugin 'wavded/vim-stylus'
Plugin 'groenewege/vim-less'
Plugin 'dockyard/vim-easydir'
Plugin 'tpope/vim-git'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'janko-m/vim-test'

call vundle#end()
filetype plugin indent on 

let g:ruby_path = '/Users/mockra/.rbenv/shims/ruby'

let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_mode_map = { "mode": "passive" }

let test#javascript#mocha#options = '-A --compilers js:babel-register'

syntax on
set t_Co=256
set bg=light
set cc=80
set cursorline
hi CursorLine term=bold cterm=bold

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

map <leader>bi :!bundle install<cr>
map <leader>v :vsplit<cr>
map <leader>f :Ag<cr>
map <leader>z :vertical resize +40<cr>
map <leader>x :vertical resize -40<cr>
map <leader>a :A<cr>
map <leader>w :w<cr>
map <leader>d <C-w><C-w>
map <leader>g :%s/\<<C-r><C-w>\>/
map <leader>P :silent !open -a Marked.app '%:p'<cr>
map <leader>p :r !pbpaste<cr>
map <leader>D :call delete(expand('%')) \| bdelete!<cr>
map <leader>s :SyntasticCheck<cr>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Wq! :wq!
nmap :WQ! :wq!

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

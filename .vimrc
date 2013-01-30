set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'ervandew/supertab'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars'
Bundle 'VimClojure'
Bundle 'tpope/vim-surround'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/syntastic'

filetype plugin indent on

syntax on
colorscheme jellybeans
set t_Co=256

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
set colorcolumn=80
set backspace=2
set ignorecase smartcase
set cursorline

set number
set numberwidth=5

set wildmode=list:longest,list:full
set complete=.,w,t
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*

au FileType gitcommit set tw=72
au BufRead,BufNewFile *.md,*.txt setlocal spell
au BufNewFile,BufRead *.md,*.txt setlocal wrap
au BufNewFile,BufRead *.md,*.txt setlocal lbr

let g:html_indent_tags = 'li\|p'
let g:Powerline_symbols = 'fancy'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

command! W w
command! Q q
map <leader>v :vsplit<cr>
map <leader>z :vertical resize +40<cr>
map <leader>x :vertical resize -40<cr>
map <leader>a :A<cr>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>

function! RunTestFile(...)
   if a:0
       let command_suffix = a:1
   else
       let command_suffix = ""
   endif

   let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
   if in_test_file
       call SetTestFile()
   elseif !exists("t:grb_test_file")
       return
   end
   call RunTests(t:grb_test_file . command_suffix)
endfunction

function! SetTestFile()
   let t:grb_test_file=@%
endfunction

function! RunTests(filename)
   :w
   if match(a:filename, '\.feature$') != -1
       exec ":!script/features " . a:filename
   else
       if filereadable("script/test")
           exec ":!script/test " . a:filename
       elseif filereadable("Gemfile")
           exec ":!bundle exec rspec --color --format doc " . a:filename
       else
           exec ":!rspec --color --format doc " . a:filename
       end
   end
endfunction

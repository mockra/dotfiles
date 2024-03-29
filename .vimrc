set shell=bash
scriptencoding utf-8
set encoding=utf-8
set nocompatible

call plug#begin('~/.vim/plugged')
" Git + Hub Commands, e.g. :Git blame
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" LSP Setup
Plug 'neovim/nvim-lspconfig'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'gfanto/fzf-lsp.nvim', { 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'

" Find/replace
Plug 'nvim-pack/nvim-spectre'

" Autocomplete
Plug 'ervandew/supertab'

" Basic vim tools
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'

" Jump around: \\w
Plug 'Lokaltog/vim-easymotion'

" Easily create files: :e
Plug 'dockyard/vim-easydir'

" Show cchanged lines
Plug 'airblade/vim-gitgutter'

" Themes
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Testiing
Plug 'janko-m/vim-test'
Plug 'bswinnerton/vim-test-github'
Plug 'benmills/vimux'

" Moving Around
Plug 'christoomey/vim-tmux-navigator'

" Highlighting
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'

" Yanking in a Codespace
Plug 'ojroques/vim-oscyank', {'branch': 'main'}
call plug#end()

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

let g:ruby_path = '/Users/mockra/.rbenv/shims/ruby'

let test#javascript#mocha#options = '-A --compilers js:babel-register'

let test#runners = {'Ruby': ['GitHub']}
let test#strategy = "vimux"
let test#ruby#rspec#executable = 'script/test'

set termguicolors
let g:tokyonight_style = 'moon'
let g:tokyonight_enable_italic = 1
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
let g:tmuxline_preset = 'nightly_fox'
colorscheme tokyonight-moon

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

syntax on
filetype indent on
filetype plugin on
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

set textwidth=109
set backspace=2
set ignorecase smartcase

set number
set numberwidth=5

set wildmode=list:longest,list:full
set complete=.,w,t
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*

set inccommand=split

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
map <leader>q :q<cr>
map <leader>h :s/:\([^ ]*\)\(\s*\)=>/\1:/g<cr>
map <leader>o :Goyo<cr>
vnoremap <leader>y :OSCYankVisual<CR>
nnoremap <leader>yf :let @*=expand("%")<CR>

vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>

nmap <silent> <leader>t :w \| :TestNearest \| :VimuxZoomRunner<CR>
nmap <silent> <leader>T :w \| :TestFile \| :VimuxZoomRunner<CR>
nmap :W :w
nmap :W! :w!
nmap :Q :q
nmap :Q! :q!
nmap :Wq! :wq!
nmap :WQ! :wq!

nnoremap <silent> go :Files<CR>
nnoremap <silent> gr :History<CR>
" Prevent Ag from matching file names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

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

" location of tags file. This file is often generated by an git post-merge
" hook or shell config file (.zshenv, .bashrc) which calls 'ctags -R'
set tags=tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-RUBY CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do this:
"   first
"     .second do |x|
"       something
"     end
" Not this:
"   first
"     .second do |x|
"     something
"   end
:let g:ruby_indent_block_style = 'do'
" Do this:
"     x = if condition
"       something
"     end
" Not this:
"     x = if condition
"           something
"         end
:let g:ruby_indent_assignment_style = 'variable'

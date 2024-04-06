local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-git",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim",
  "nvim-pack/nvim-spectre",
  "ervandew/supertab",
  "tpope/vim-sensible",
  "tpope/vim-endwise",
  "tpope/vim-surround",
  "tpope/vim-eunuch",
  "Lokaltog/vim-easymotion",
  "dockyard/vim-easydir",
  "airblade/vim-gitgutter",
  "itchyny/lightline.vim",
  "edkolev/tmuxline.vim",
  { "folke/tokyonight.nvim", branch = "main" },
  "janko-m/vim-test",
  "bswinnerton/vim-test-github",
  "benmills/vimux",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-rails",
  "sheerun/vim-polyglot",
  { "ojroques/vim-oscyank", branch = "main" },
  "b0o/mapx.nvim",
  { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
})

require'mapx'.setup{ global = true }

map("<leader>bi", ":!bundle install<cr>")
map("<leader>v", ":vsplit<cr>")
map("<leader>f", ":Ag<cr>")
map("<leader>a", ":A<cr>")
map("<leader>w", ":w<cr>")
map("<leader>g", ":%s/\\<<C-r><C-w>\\>/")
map("<leader>p", ":r !pbpaste<cr>")
map("<leader>D", ":call delete(expand('%')) \\| bdelete!<cr>")
map("<leader>s", ":%sort<cr>")
map("<leader>q", ":q<cr>")
map("<leader>h", ":s/:\\([^ ]*\\)\\(\\s*\\)=>/\\1:/g<cr>")
map("<leader>o", ":Goyo<cr>")
vnoremap("<leader>y", ":OSCYankVisual<CR>")
nnoremap("<leader>yf", ":let @*=expand('%')<CR>")

vnoremap("<leader>s", "<esc>:lua require('spectre').open_visual()<CR>")

-- nmap("<silent> <leader>t", ":w \| :TestNearest \| :VimuxZoomRunner<CR>")
-- nmap("<silent> <leader>T", ":w \| :TestFile \| :VimuxZoomRunner<CR>")
nmap(":W", ":w")
nmap(":W!", ":w!")
nmap(":Q", ":q")
nmap(":Q!", ":q!")
nmap(":Wq!", ":wq!")
nmap(":WQ!", ":wq!")

nnoremap("go", ":Telescope find_files<CR>", "silent")
nnoremap("gr", ":Telescope search_history<CR>", "silent")

map("<Leader>z", ":VimuxZoomRunner<CR>")

vim.go.VimuxHeight = "10"
vim.go.ruby_path = "/Users/mockra/.rbenv/shims/ruby"

vim.go["test#javascript#mocha#options"] = "-A --compilers js:babel-register"
vim.go["test#runners"] = "{ Ruby = { 'GitHub' } }"
vim.go["test#strategy"] = "vimux"
vim.go["test#ruby#rspec#executable"] = "script/test"

vim.go.ruby_indent_block_style = 'do'
vim.go.ruby_indent_assignment_style = 'variable'

vim.go.tokyonight_style = "moon"
vim.go.tokyonight_enable_italic = 1
vim.go.tmuxline_preset = "nightly_fox"

vim.go.lightline = [[{
  'colorscheme': 'tokyonight'
}]]

vim.cmd [[colorscheme tokyonight-moon]]
vim.cmd [[set termguicolors]]
vim.cmd [[set shell=bash]]
vim.cmd [[set encoding=utf-8]]
vim.cmd [[set nocompatible]]

vim.cmd("set t_Co=256")
vim.cmd("set cc=+1")
vim.cmd("set cursorline")

vim.cmd("set nobackup")
vim.cmd("set nowritebackup")
vim.cmd("set noswapfile")
vim.cmd("set history=50")
vim.cmd("set ruler")
vim.cmd("set showcmd")
vim.cmd("set incsearch")
vim.cmd("set laststatus=2")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set smarttab")
vim.cmd("set expandtab")
vim.cmd("set hlsearch")
vim.cmd("set list listchars=tab:»·,trail:·")
vim.cmd("set lazyredraw")

vim.cmd("set textwidth=109")
vim.cmd("set backspace=2")
vim.cmd("set ignorecase smartcase")

vim.cmd("set number")
vim.cmd("set numberwidth=5")

vim.cmd("set wildmode=list:longest,list:full")
vim.cmd("set complete=.,w,t")
vim.cmd("set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/node_modules/*")

vim.cmd("set inccommand=split")

map("<leader>n", ":Rename ")
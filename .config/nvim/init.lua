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
  -- Git + Hub Commands, e.g. :Git blame
  "tpope/vim-git",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- LSP Setup
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim",

  -- Find/replace
  "nvim-pack/nvim-spectre",

  -- Autocomplete
  "ervandew/supertab",

  -- Basic vim tools
  "tpope/vim-sensible",
  "tpope/vim-endwise",
  "tpope/vim-surround",
  "tpope/vim-eunuch",

  -- Jump around: \\w
  "Lokaltog/vim-easymotion",

  -- Easily create files: :e
  "dockyard/vim-easydir",

  -- Show changed lines
  "airblade/vim-gitgutter",

  -- Themeing
  "itchyny/lightline.vim",
  "edkolev/tmuxline.vim",
  { "folke/tokyonight.nvim", branch = "main" },

  -- Testing
  "janko-m/vim-test",
  "benmills/vimux",
  "christoomey/vim-tmux-navigator",

  -- Language stuff
  "tpope/vim-rails",
  "sheerun/vim-polyglot",

  -- Make yanking work
  { "ojroques/vim-oscyank", branch = "main" },

  -- Easy lua mapping for vim
  "b0o/mapx.nvim",

  -- Clear search highlighting
  "romainl/vim-cool",

  -- Search/fuzzy find window
  { "junegunn/fzf", build = "./install --bin" },
  "ibhagwan/fzf-lua",
})

-- Key mappings
require('mapx').setup{ global = true }

map("<leader>bi", ":!bundle install<cr>")
map("<leader>v", ":vsplit<cr>")
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

nmap("<leader>t", ":w | :TestNearest | :VimuxZoomRunner<CR>", "silent")
map("<leader>T", ":w | :TestFile | :VimuxZoomRunner<CR>", "silent")
nmap(":W", ":w")
nmap(":W!", ":w!")
nmap(":Q", ":q")
nmap(":Q!", ":q!")
nmap(":Wq!", ":wq!")
nmap(":WQ!", ":wq!")

map("<leader>f", ":FzfLua live_grep<cr>")
nnoremap("go", ":FzfLua files<CR>", "silent")
nnoremap("gr", ":FzfLua oldfiles<CR>", "silent")

map("<Leader>z", ":VimuxZoomRunner<CR>")

vim.g.VimuxHeight = "10"
vim.g.ruby_path = "/Users/mockra/.rbenv/shims/ruby"

vim.o["test#javascript#mocha#options"] = "-A --compilers js:babel-register"
vim.o["test#strategy"] = "vimux"
vim.o["test#ruby#rspec#executable"] = "script/test"

vim.g.ruby_indent_block_style = 'do'
vim.g.ruby_indent_assignment_style = 'variable'

vim.g.tokyonight_style = "moon"
vim.g.tokyonight_enable_italic = 1
vim.g.tmuxline_preset = "nightly_fox"

vim.g.lightline = { colorscheme = 'tokyonight' }

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


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

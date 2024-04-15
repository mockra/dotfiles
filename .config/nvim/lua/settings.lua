vim.g.VimuxHeight = "10"
vim.g.ruby_path = "/Users/mockra/.rbenv/shims/ruby"

vim.g["test#javascript#mocha#options"] = "-A --compilers js:babel-register"
vim.g["test#strategy"] = "vimux"
vim.g["test#ruby#rspec#executable"] = "script/test"
vim.g["test#javascript#runner"] = 'jest'

vim.g.ruby_indent_block_style = 'do'
vim.g.ruby_indent_assignment_style = 'variable'

vim.g.tokyonight_style = "moon"
vim.g.tokyonight_enable_italic = 1
vim.g.tmuxline_preset = "nightly_fox"

vim.g.lightline = { colorscheme = 'tokyonight' }

vim.cmd [[set nocompatible]]
vim.cmd [[colorscheme tokyonight-moon]]
vim.cmd [[set termguicolors]]
vim.cmd [[set shell=bash]]
vim.cmd [[set encoding=utf-8]]

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

vim.env.FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
-- Tokyonight-moon colors
vim.env.FZF_DEFAULT_OPTS = [[
--border
--color=fg:#c8d3f5,bg:#222436,hl:#ff966c
--color=fg+:#c8d3f5,bg+:#2f334d,hl+:#ff966c
--color=info:#82aaff,prompt:#86e1fc,pointer:#86e1fc
--color=marker:#c3e88d,spinner:#c3e88d,header:#c3e88d
]]

---- Tokyonight-day colors
--vim.env.FZF_DEFAULT_OPTS = [[
----border
----color=fg:#3760bf,bg:#e1e2e7,hl:#b15c00
----color=fg+:#3760bf,bg+:#c4c8da,hl+:#b15c00
----color=info:#2e7de9,prompt:#007197,pointer:#007197
----color=marker:#587539,spinner:#587539,header:#587539
--]]

vim.g.fzf_colors = {
  hl =      { 'fg', 'Comment' },
  ["hl+"] =     { 'fg', 'Statement' },
 }

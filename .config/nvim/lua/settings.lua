vim.g.VimuxHeight = "10"
vim.g.ruby_path = "/Users/mockra/.rbenv/shims/ruby"

vim.g["test#javascript#mocha#options"] = "-A --compilers js:babel-register"
vim.g["test#strategy"] = "vimux"
vim.g["test#go#gotest#executable"] = "script/test -f"
vim.g["test#javascript#runner"] = "jest"

vim.g.ruby_indent_block_style = "do"
vim.g.ruby_indent_assignment_style = "variable"

vim.opt.background = "dark"
vim.g.lightline = { colorscheme = "rosepine_moon" }

vim.cmd([[set nocompatible]])
require("rose-pine").setup({
  variant = "moon",
  styles = {
    italic = true,
  },
})
vim.cmd([[colorscheme rose-pine-moon]])
vim.cmd([[set termguicolors]])
vim.cmd([[set shell=bash]])
vim.cmd([[set encoding=utf-8]])

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
-- Rosé Pine Moon colors
vim.env.FZF_DEFAULT_OPTS = [[
--border
--color=fg:#e0def4,bg:#232136,hl:#eb6f92
--color=fg+:#e0def4,bg+:#2a273f,hl+:#eb6f92
--color=info:#3e8fb0,prompt:#c4a7e7,pointer:#c4a7e7
--color=marker:#9ccfd8,spinner:#9ccfd8,header:#9ccfd8
]]

vim.g.fzf_colors = {
  hl = { "fg", "Comment" },
  ["hl+"] = { "fg", "Statement" },
}

-- Function to build quickfix list from selected lines
local function build_quickfix_list(lines)
  local qf_entries = {}
  for _, line in ipairs(lines) do
    table.insert(qf_entries, { filename = line })
  end
  vim.fn.setqflist(qf_entries)
  vim.cmd("copen")
  vim.cmd("cc")
end

vim.g.fzf_action = {
  ["ctrl-t"] = build_quickfix_list,
}

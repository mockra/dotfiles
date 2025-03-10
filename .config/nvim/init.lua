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

  -- Dependencies
  "nvim-lua/plenary.nvim",

  -- Find/replace
  "nvim-pack/nvim-spectre",

  -- FZF Fuzzy Search
  'junegunn/fzf',
  'junegunn/fzf.vim',

  -- Autocomplete
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-git',
  "lukas-reineke/cmp-rg",

  -- Autocomplete Snippets
  "L3MON4D3/LuaSnip",
  'saadparwaiz1/cmp_luasnip',
  "rafamadriz/friendly-snippets",
  -- LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'gfanto/fzf-lsp.nvim',

  -- Copilot
  "zbirenbaum/copilot.lua",
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-3.5-sonnet",
    },
    cmd = {
      "CopilotChat",
      "CopilotChatToggle",
      "CopilotChatAgents",
      "CopilotChatModels",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatCommit",
    },
    keys = {
      { "<leader>aa", "<cmd>CopilotChatToggle<CR>", desc = "Toggle AI Chat" },
      { "<leader>ae", "<cmd>CopilotChatExplain<CR>", mode = { "v", "n" }, desc = "AI Explain" },
      { "<leader>ar", "<cmd>CopilotChatReview<CR>", mode = { "v", "n" }, desc = "AI Review" },
      { "<leader>af", "<cmd>CopilotChatFix<CR>", mode = { "v", "n" }, desc = "AI Fix" },
      { "<leader>ao", "<cmd>CopilotChatOptimize<CR>", mode = { "v", "n" }, desc = "AI Optimize" },
      { "<leader>at", "<cmd>CopilotChatTests<CR>", mode = { "v", "n" }, desc = "AI Tests" },
      { "<leader>am", "<cmd>CopilotChatModels<CR>", mode = { "v", "n" }, desc = "AI Models" },
      { "<leader>ax", "<cmd>CopilotChatReset<CR>", desc = "AI Chat Reset" },
    },
  },

  -- Basic vim tools
  "tpope/vim-sensible",
  "tpope/vim-endwise",
  "tpope/vim-surround",
  "tpope/vim-eunuch",

  -- Jump around: \\w
  "Lokaltog/vim-easymotion",

  -- Easily create files: :e
  "dockyard/vim-easydir",

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
  "benmills/vim-golang-alternate",

  -- Go
  {
    "fatih/vim-go",
    config = function()
      vim.cmd.GoInstallBinaries()
    end,
  },

  -- Make yanking work
  { "ojroques/vim-oscyank", branch = "main" },

  -- Easy lua mapping for vim
  "b0o/mapx.nvim",

  -- Clear search highlighting
  "romainl/vim-cool",

  -- Search/fuzzy find window
  --{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  --{ 'nvim-telescope/telescope.nvim',
  --  dependencies = { 'nvim-lua/plenary.nvim' },
  --  opts = function()
  --    return require "configs.telescope"
  --  end,
  --  config = function(_, opts)
  --    local telescope = require "telescope"
  --    telescope.setup(opts)

  --    -- load extensions
  --    for _, ext in ipairs(opts.extensions_list) do
  --      telescope.load_extension(ext)
  --    end
  --  end,
  --},
})

require("settings")
require("keymaps")
require("configs/cmp")

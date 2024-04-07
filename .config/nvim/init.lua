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
  -- "ervandew/supertab",

  -- Autocomplete
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-git',
  'delphinus/cmp-ctags',
  'ludovicchabant/vim-gutentags',

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
  "kelly-lin/telescope-ag",
  "nvim-telescope/telescope-live-grep-args.nvim",
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = function()
      return require "configs.telescope"
    end,
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
})

require("settings")
require("keymaps")
require("configs/cmp")
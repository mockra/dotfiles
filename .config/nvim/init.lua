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
  "tpope/vim-abolish",
  "tpope/vim-git",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Dependencies
  "nvim-lua/plenary.nvim",

  -- Find/replace
  "nvim-pack/nvim-spectre",

  -- FZF Fuzzy Search
  "junegunn/fzf",
  "junegunn/fzf.vim",

  -- Personal Plugins
  "mockra/commit-mates",

  -- Blink
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      nes = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      keymap = { preset = "super-tab" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
          treesitter_highlighting = true,
          window = {
            border = "rounded",
          },
        },
        menu = {
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          border = "rounded",
        },
      },
      sources = {
        default = { "copilot", "path", "snippets", "buffer" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
  },
  {
    -- If you are using mason.nvim, you can install copilot-language-server automatically
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "copilot-language-server" } },
  },
  "gfanto/fzf-lsp.nvim",

  -- Copilot
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      {
        "<c-.>",
        function()
          require("sidekick.cli").focus()
        end,
        mode = { "n", "x", "i", "t" },
        desc = "Sidekick Switch Focus",
      },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "copilot", focus = true })
        end,
        desc = "Sidekick Toggle Copilot",
      },
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

  -- Navigation between tmux and vim splits
  "christoomey/vim-tmux-navigator",
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { mode = "n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { mode = "n", "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { mode = "n", "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { mode = "n", "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { mode = "n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
      { mode = "t", "<c-h>", "<C-w><cmd>TmuxNavigateLeft<cr>" },
      { mode = "t", "<c-j>", "<C-w><cmd>TmuxNavigateDown<cr>" },
      { mode = "t", "<c-k>", "<C-w><cmd>TmuxNavigateUp<cr>" },
      { mode = "t", "<c-l>", "<C-w><cmd>TmuxNavigateRight<cr>" },
      { mode = "t", "<c-\\>", "<C-w><cmd>TmuxNavigatePrevious<cr>" },
    },
    init = function()
      -- Disable default mappings to make it work in terminal mode
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },

  -- Language stuff
  "tpope/vim-rails",
  "sheerun/vim-polyglot",
  "benmills/vim-golang-alternate",

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        lua = { "stylua" },
      },
    },
    formatters = {
      prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
      },
    },
  },

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
vim.lsp.enable("copilot")

require("settings")
require("keymaps")

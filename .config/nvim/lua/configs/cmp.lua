-- CMP
local cmp = require'cmp'

vim.g.vsnip_filetypes.ruby = { 'rails' }

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        cmp.confirm({ select = true})
      else
        fallback()
      end
    end)
  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'copilot' },
    }, {
      { name = 'buffer' },
    })
  })

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

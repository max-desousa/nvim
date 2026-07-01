return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",  -- Load when you enter insert mode
    dependencies = {
      -- Core completion sources
      "hrsh7th/cmp-nvim-lsp",      -- LSP source
      "hrsh7th/cmp-buffer",        -- Buffer words
      "hrsh7th/cmp-path",          -- Filesystem paths
      "hrsh7th/cmp-cmdline",       -- Command-line completions (optional)

      -- Snippet engine (choose one)
      "L3MON4D3/LuaSnip",          -- Popular choice
      "saadparwaiz1/cmp_luasnip",  -- LuaSnip bridge

      -- Optional but nice
      "onsails/lspkind.nvim",      -- Icons in completion menu
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load LuaSnip friendly-snippets (optional but recommended)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })

      -- `/` and `?` cmdline setup
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })

      -- `:` cmdline setup
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
}

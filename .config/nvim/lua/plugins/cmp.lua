-- cmp.lua
return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-emoji',
      'L3MON4D3/LuaSnip',  -- Ensure you have LuaSnip as a dependency
    },
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
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
      })
    end,

    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      vim.o.completeopt = 'menuone,noselect,noinsert'
 --     vim.o.autocomplete = true

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },

        formatting = {
          format = function(entry, vim_item)
            local lspkind = require("lspkind") -- Make sure lspkind is available
            if lspkind then
              vim_item.kind = lspkind.presets.default[vim_item.kind]
            end

            -- Truncate long completion labels
            local MAX_LABEL_WIDTH = 35
            local label = vim_item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
            if truncated_label ~= label then
              vim_item.abbr = truncated_label .. '…'
            end

            -- Set a custom menu for each source
            vim_item.menu = ({
              buffer = "[Buff]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
            })[entry.source.name]
            return vim_item
          end,
        },

        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lua' },
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'buffer', keyword_length = 1 },
        },

        window = {
          documentation = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
          },
          completion = {
            border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"},
          }
        },
      })
    end,
  },
}


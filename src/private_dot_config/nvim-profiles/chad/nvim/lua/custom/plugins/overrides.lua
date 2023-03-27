local M = {}

M.telescope = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--follow",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--no-ignore-vcs",
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "css",
    "html",
    "http",
    "javascript",
    "json5",
    "lua",
    "terraform",
    "vim",
    "yaml",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- Shell
    "shfmt",
    "shellcheck",

    "terraform-ls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = function()
  local cmp = require "cmp"
  return {
    experimental = {
      ghost_text = true,
    },
    preselect = cmp.PreselectMode.None,
    sources = {
      { name = "copilot", group_index = 2 },
      { name = "nvim_lsp", group_index = 2 },
      { name = "nvim_lua", group_index = 2 },
      { name = "luasnip", group_index = 2 },
      { name = "buffer", group_index = 2 },
      { name = "path", group_index = 2 },
    },
    mappings = {
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
    },
    formatting = {
      format = function(entry, vim_item)
        local icons = require("nvchad_ui.icons").lspkind
        if entry.source.name == "copilot" then
          vim_item.kind = "  Copilot"
          vim_item.kind_hl_group = "CmpItemKindCopilot"
          return vim_item
        end
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        return vim_item
      end,
    },
    sorting = {
      priority_weight = 2,
      comparators = {

        require("copilot_cmp.comparators").prioritize,
        require("copilot_cmp.comparators").score,
        cmp.config.compare.exact,

        -- Below is the default comparitor list and order for nvim-cmp
        -- cmp.config.compare.offset,
        cmp.config.compare.score,
        cmp.config.compare.recently_used,
        cmp.config.compare.locality,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },
  }
end

return M

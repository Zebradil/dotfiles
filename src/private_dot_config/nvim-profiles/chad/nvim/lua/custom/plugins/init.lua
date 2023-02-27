local overrides = require "custom.plugins.overrides"

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {

  -- Dashboard
  ["goolord/alpha-nvim"] = { disable = false },

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["zbirenbaum/copilot.lua"] = {
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          gitcommit = true,
          markdown = true,
          yaml = true,
        },
      }
    end,
  },
  ["zbirenbaum/copilot-cmp"] = {
    after = { "copilot.lua", "nvim-cmp" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins

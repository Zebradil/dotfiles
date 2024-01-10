return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.dracula-nvim" },
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.colorscheme.sonokai" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },

  { "catppuccin", lazy = false },
  { "Mofiqul/dracula.nvim", lazy = false },
  { "rebelot/kanagawa.nvim", lazy = false },
  { "EdenEast/nightfox.nvim", lazy = false },
  { "sainnhe/sonokai", lazy = false },
  { "folke/tokyonight.nvim", lazy = false },

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  -- This stopped working
  -- { import = "astrocommunity.editing-support.cutlass-nvim" },
  -- {
  --   "cutlass.nvim",
  --   opts = {
  --     cut_key = "x",
  --     registers = {
  --       select = "s",
  --       delete = "d",
  --       change = "c",
  --     },
  --   },
  -- },

  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.octo-nvim" },

  { import = "astrocommunity.note-taking.neorg" },

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.just" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.search.nvim-hlslens" },

  { import = "astrocommunity.completion.copilot-lua-cmp" },
  {
    "copilot.lua",
    opts = {
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
      },
    },
  },
}

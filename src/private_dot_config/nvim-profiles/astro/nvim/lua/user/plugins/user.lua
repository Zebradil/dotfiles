return {
  { "NoahTheDuke/vim-just", event = { "BufReadPre", "BufNewFile" }, ft = { "\\cjustfile", "*.just", ".justfile" } },
  { "Shatur/neovim-ayu", lazy = false },
  { "jacoborus/tender.vim", lazy = false },
  { "junegunn/fzf", lazy = false },
  { "junegunn/fzf.vim", lazy = false },
  { "tpope/vim-abolish", lazy = false },
  { "tridactyl/vim-tridactyl", ft = "tridactyl" },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}

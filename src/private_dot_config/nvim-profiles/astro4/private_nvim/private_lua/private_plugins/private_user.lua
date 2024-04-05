-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  { "junegunn/fzf", lazy = false },
  { "junegunn/fzf.vim", lazy = false },
  { "tridactyl/vim-tridactyl", ft = "tridactyl" },
  { "tpope/vim-abolish", lazy = false },

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = [[
 ,gggggggg,
d8P""""""Y8b,            ,dPYb,                                     8I        ,dPYb,
88,_a     `8b            IP'`Yb                                     8I        IP'`Yb
`Y8P"      88            I8  8I                                     8I   gg   I8  8I
           88            I8  8'                                     8I   ""   I8  8'
          d8'    ,ggg,   I8 dP        ,gggggg,    ,gggg,gg    ,gggg,8I   gg   I8 dP
       _,d8'    i8" "8i  I8dP   88gg  dP""""8I   dP"  "Y8I   dP"  "Y8I   88   I8dP
     d8888ba,   I8, ,8I  I8P    8I   ,8'    8I  i8'    ,8I  i8'    ,8I   88   I8P
         "Y88b, `YbadP' ,d8b,  ,8I  ,dP     Y8,,d8,   ,d8b,,d8,   ,d8b,_,88,_,d8b,_
         ,d8888888P"Y8888P'"Y88P"'  8P      `Y8P"Y8888P"`Y8P"Y8888P"`Y88P""Y88P'"Y88
       ,8P"  88
      d8'    88
     d8'    ,88
     88     d8'
     Y8,_ _,8P
      "Y888P"]]
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}

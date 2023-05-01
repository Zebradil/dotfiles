return {
    -- Add the community repository of plugin specifications
    "AstroNvim/astrocommunity",
    -- example of imporing a plugin, comment out to use it or add your own
    -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

    { import = "astrocommunity.colorscheme.catppuccin" },
    { import = "astrocommunity.colorscheme.dracula" },
    { import = "astrocommunity.colorscheme.kanagawa" },
    { import = "astrocommunity.colorscheme.nightfox" },
    { import = "astrocommunity.colorscheme.tokyonight" },
    { import = "astrocommunity.completion.copilot-lua-cmp" },
    {
    -- further customize the options set by the community
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

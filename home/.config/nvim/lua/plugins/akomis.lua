return {
    {
        "catgoose/nvim-colorizer.lua",
        event = "BufReadPre",
        opts = { -- set to setup table
        }
    }, -- add gruvbox
    {"ellisonleao/gruvbox.nvim"}, -- Configure LazyVim to load gruvbox
    {"LazyVim/LazyVim", opts = {colorscheme = "gruvbox"}}
}

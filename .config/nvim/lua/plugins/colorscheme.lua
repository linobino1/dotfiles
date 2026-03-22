return {
  -- add nightwolf
  {
    "ricardoraposo/nightwolf.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Configure LazyVim to load nightwolf
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightwolf",
    },
  },
}

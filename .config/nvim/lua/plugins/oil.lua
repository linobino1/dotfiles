return {
  "stevearc/oil.nvim",
  lazy = true,
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>fo", "<cmd>Oil<CR>", desc = "File Explorer" },
  },
  opts = {
    default_file_explorer = false,
    view_options = {
      show_hidden = true,
    },
  },
}

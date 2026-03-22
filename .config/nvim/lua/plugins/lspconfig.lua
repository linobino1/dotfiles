return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "<leader>cc", mode = { "n", "x", "v" }, false },
        },
      },
    },
  },
}

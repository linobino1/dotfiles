return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      denols = {
        enabled = true,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "jsonc",
        },
      },
    },
  },
}

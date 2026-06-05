return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers["*"] = opts.servers["*"] or {}
    opts.servers["*"] = vim.tbl_deep_extend("force", opts.servers["*"], {
      keys = {
        { "<leader>cc", mode = { "n", "x", "v" }, false },
      },
    })

    if opts.servers then
      opts.servers.copilot = nil
    end
  end,
}

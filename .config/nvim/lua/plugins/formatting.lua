return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      html = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      svg = { "xmlformatter" },
      xml = { "xmlformatter" },
      yaml = { "prettierd" },
    })
    return opts
  end,
}

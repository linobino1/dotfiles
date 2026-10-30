return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      html = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      markdown = { "prettier_markdown" },
      ["markdown.mdx"] = { "prettier_markdown" },
      svg = { "xmlformatter" },
      xml = { "xmlformatter" },
      yaml = { "prettierd" },
    })

    opts.formatters = opts.formatters or {}
    opts.formatters.prettier_markdown = {
      command = "prettier",
      args = { "--prose-wrap", "always", "--stdin-filepath", "$FILENAME" },
      stdin = true,
    }

    return opts
  end,
}

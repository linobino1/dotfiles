-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.wrap = true

-- show LSP errors, warnings, etc. in their own line
vim.diagnostic.config({
  virtual_lines = true,
  virtual_text = false,
})

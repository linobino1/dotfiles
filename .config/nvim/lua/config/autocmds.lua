-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- run `deno lint --fix` on js/ts files and then run the formatter via LSP
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    -- only run in Deno projects
    if vim.fn.filereadable("deno.json") == 0 and vim.fn.filereadable("deno.jsonc") == 0 then
      return
    end

    local file = vim.fn.expand("%")

    -- run lint fix
    vim.fn.system({ "deno", "lint", "--fix", file })

    -- force reload buffer if changed
    vim.cmd("edit!")
  end,
})

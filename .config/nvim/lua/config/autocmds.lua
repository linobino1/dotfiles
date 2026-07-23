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

-- show  diagnostics in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      border = "rounded",
      source = "always",
    })
  end,
})

-- MiniFiles mappings for working with the entry under the cursor.
local mini_files_mappings = vim.api.nvim_create_augroup("mini_files_mappings", { clear = true })

---@diagnostic disable: undefined-global
local get_mini_files_path = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then
    vim.notify("Cursor is not on valid entry")
    return nil
  end
  return path
end

local set_cwd = function()
  local path = get_mini_files_path()
  if path == nil then
    return
  end
  vim.fn.chdir(vim.fs.dirname(path))
end

local yank_absolute_path = function()
  local path = get_mini_files_path()
  if path == nil then
    return
  end
  vim.fn.setreg(vim.v.register, path)
end

local yank_relative_path = function()
  local path = get_mini_files_path()
  if path == nil then
    return
  end

  local root = require("lazyvim.util").root({ normalize = true })
  local normalized_path = vim.fs.normalize(path)

  if normalized_path == root then
    vim.fn.setreg(vim.v.register, ".")
    return
  end

  local root_prefix = root .. "/"
  if normalized_path:sub(1, #root_prefix) ~= root_prefix then
    vim.notify("Entry is not under the project root")
    return
  end

  vim.fn.setreg(vim.v.register, normalized_path:sub(#root_prefix + 1))
end

local ui_open = function()
  local path = get_mini_files_path()
  if path == nil then
    return
  end
  vim.ui.open(path)
end
---@diagnostic enable: undefined-global

vim.api.nvim_create_autocmd("User", {
  group = mini_files_mappings,
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set("n", "g~", set_cwd, { buffer = b, desc = "Set cwd" })
    vim.keymap.set("n", "gX", ui_open, { buffer = b, desc = "open with default app" })
    vim.keymap.set("n", "gy", yank_relative_path, { buffer = b, desc = "Yank relative path" })
    vim.keymap.set("n", "gY", yank_absolute_path, { buffer = b, desc = "Yank absolute path" })
  end,
})

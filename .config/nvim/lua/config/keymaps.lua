-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>")

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Copilot Chat
vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Copilot Chat" })

vim.keymap.set("n", "<leader>rr", function()
  require("lazy").reload()
end, { desc = "Reload LazyVim config" })

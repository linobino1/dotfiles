return {
  "sudo-tee/opencode.nvim",
  init = function()
    local pending = false
    vim.api.nvim_create_autocmd("User", {
      group = vim.api.nvim_create_augroup("opencode_checktime", { clear = true }),
      pattern = "OpencodeEvent:*",
      callback = function()
        if pending then
          return
        end
        pending = true
        vim.defer_fn(function()
          pending = false
          vim.cmd("checktime")
        end, 200)
      end,
    })
  end,
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
        file_types = { "markdown", "opencode_output" },
      },
      ft = { "markdown", "opencode_output" },
    },
  },
  opts = {
    keymap = {
      session_picker = {
        fork_session = { "<C-x>", desc = "Fork selected session" },
      },
    },
  },
}

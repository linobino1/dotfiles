return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    local fzf = require("fzf-lua")
    actions = fzf.actions

    opts.files = {
      actions = {
        ["ctrl-i"] = { actions.toggle_ignore },
        ["ctrl-h"] = { actions.toggle_hidden },
      },
    }
  end,
}

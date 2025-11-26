return {
  "github/copilot.vim",

  init = function()
    vim.g.copilot_enabled = false
    -- vim.g.copilot_no_tab_map = true
  end,

  keys = {
    { "<leader>cp", "<cmd>Copilot enable<CR>", desc = "Copilot: enable" },
    { "<leader>cd", "<cmd>Copilot disable<CR>", desc = "Copilot: disable" },
  },
}


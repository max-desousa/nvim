-- lua/plugins/rose-pine.lua
return { 
  "rose-pine/neovim", 
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Make background transparent
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Make background transparent
  end
}

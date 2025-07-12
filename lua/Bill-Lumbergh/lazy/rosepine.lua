-- lua/plugins/rose-pine.lua
return { 
  "rose-pine/neovim", 
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Make background transparent
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Make background transparent
    vim.api.nvim_set_hl(0, "Normal", { bg = nil, ctermbg = nil })  -- Non-current windows
    vim.api.nvim_set_hl(0, "NormalNC", { bg = nil, ctermbg = nil })  -- Non-current windows
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil, ctermbg = nil })  -- Floating windows/panes
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = nil, ctermbg = nil })  -- Float borders
    vim.api.nvim_set_hl(0, "SignColumn", { bg = nil, ctermbg = nil })  -- Sign/gutter column
    vim.api.nvim_set_hl(0, "LineNr", { bg = nil, ctermbg = nil })  -- Line numbers
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = nil, ctermbg = nil })  -- Buffer end (~ lines)
    vim.api.nvim_set_hl(0, "StatusLine", { bg = nil, ctermbg = nil })  -- Statusline
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = nil, ctermbg = nil })  -- Non-current statuslineackground transparent

    vim.o.winblend = 20

    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nil, ctermbg = nil })  -- Telescope normal
  end
}

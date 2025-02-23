require("config.lazy")
print("Welcome PaperJammer!")

--[[
vim.cmd("colorscheme zaibatsu")
--]]
--vim.cmd("colorscheme kanagawa")
vim.cmd("colorscheme cyberdream")

vim.cmd("set cc=80")
vim.cmd("set cursorcolumn")
vim.cmd("set cursorline")

vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set autoindent")
vim.cmd("set expandtab")
vim.cmd("set smarttab")
vim.cmd("set shiftwidth=2")
vim.cmd("set tabstop=2")

vim.cmd("set listchars=tab:<->,space:·,eol:$,extends:»,precedes:«")
vim.cmd("set list")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
})

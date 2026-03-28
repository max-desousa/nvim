--vim.cmd("colorscheme zaibatsu")
--vim.cmd("colorscheme kanagawa")
--vim.cmd("colorscheme cyberdream")

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

vim.diagnostic.config({
  virtual_text = true,        -- This enables the red text at the end of the line
  signs = true,               -- Keeps the 'E' in the sign column (gutter)
  underline = true,           -- Underlines the problematic code
  update_in_insert = false,   -- Don't update while you're still typing
  severity_sort = true,
})

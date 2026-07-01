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

vim.cmd.colorscheme("retrobox")

-- Commenting out random color scheme... it's nice to sample things but it's
-- bad after finding a colorscheme that you start liking
--
-- -- Random colorscheme on startup
-- -- Easiest way to get all possible color schemes to add to this list:
-- -- :lua print(vim.inspect(vim.fn.getcompletion("", "color")))
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- Seed the random number generator properly
--     math.randomseed(os.time() + vim.fn.getpid())   -- Good enough
--     -- Alternative (even more random):
--     -- math.randomseed(os.time() ^ vim.loop.hrtime())
-- 
--     local schemes = {
--       "blue", "catppuccin", "citruszest", "cyberdream", "cyberdream-light",
--       "darkblue", "default", "delek", "desert", "elflord", "evening",
--       "habamax", "industry", "kanagawa", "kanagawa-dragon", "kanagawa-lotus",
--       "kanagawa-wave", "koehler", "lunaperche", "morning", "murphy", "pablo",
--       "peachpuff", "quiet", "retrobox", "ron", "rose-pine", "rose-pine-dawn",
--       "rose-pine-main", "rose-pine-moon", "shine", "slate", "sorbet", "torte",
--       "unokai", "vim", "wildcharm", "zaibatsu", "zellner",
--       -- Add more here as you install them
--     }
-- 
--     local random = schemes[math.random(#schemes)]
--     vim.cmd("colorscheme " .. random)
-- 
--     -- Optional: Show which one was chosen
--     vim.notify("Colorscheme: " .. random, vim.log.levels.INFO)
--   end,
-- })
-- 

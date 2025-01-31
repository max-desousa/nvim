return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "go" },

      sync_install = false,

      auto_install = false,

      highlight = {
        enable = true,
      },
    }
  end,
}

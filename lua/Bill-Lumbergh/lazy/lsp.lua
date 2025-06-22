return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").rust_analyzer.setup {
      }
      require("lspconfig").clangd.setup({
        cmd = {'clangd-15', '--background-index', '--clang-tidy', '--log=verbose'},
        --init_options = {
        --  fallbackFlags = { '-std=c++17' },
        --},
      })
    end,
  }
}

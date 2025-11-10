return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.rust_analyzer.setup {
      }
      lspconfig.clangd.setup({
        cmd = {'clangd-15', '--background-index', '--clang-tidy', '--log=verbose'},
        --init_options = {
        --  fallbackFlags = { '-std=c++17' },
        --},
      })
      lspconfig.zls.setup {
        cmd = { "zls" },
        filetypes = { "zig" },
        root_dir = lspconfig.util.root_pattern("build.zig", ".git"),
        settings = {
          zls = {
            zig_exe_path = "/home/max/.zig/zig/zig",
            zig_lib_path = "/home/max/.zig/lib",
          }
        }
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end,
      })
    end,
  }
}

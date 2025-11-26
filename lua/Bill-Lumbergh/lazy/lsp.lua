return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = vim.lsp.config
      vim.lsp.config('rust_analyzer', {
      })
      vim.lsp.config('clangd', {
        cmd = {'clangd-15', '--background-index', '--clang-tidy', '--log=verbose'},
        --init_options = {
        --  fallbackFlags = { '-std=c++17' },
        --},
      })
      -- vim.lsp.config('zls', {
      --   filetypes = { "zig" },
      --   -- root_dir = lspconfig.util.root_pattern("build.zig", ".git"),
      --   -- root_dir = function(fname)
      --   --   local path = vim.fs.dirname(fname)
      --   --   local found = vim.fs.find({ "build.zig", ".git" }, { path = path, upward = true })
      --   --   if #found > 0 then
      --   --     return vim.fs.dirname(found[1])
      --   --   end
      --   -- end,
      --   enable_snippets = true,
      --   enable_argument_placeholders = true,
      --   c_source_finder = true,
      --   c_source_files, "all",
      --   settings = {
      --     zls = {
      --       zig_exe_path = "/home/max/.zig/zig/zig",
      --       zig_lib_path = "/home/max/.zig/zig/lib",
      --     }
      --   }
      -- })
      vim.lsp.config('zls', {
        settings = {
          zls = {
            zig_exe_path = "/home/max/.zig/zig/zig",
            zig_lib_path = "/home/max/.zig/zig/lib",
            enable_snippets = true,
            enable_argument_placeholders = true,
            c_source_finder = true,
          }
        }
      })
      vim.lsp.enable('zls')
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

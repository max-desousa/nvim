return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	requires = { {'nvim-lua/plenary.nvim'} },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fH', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>fG', builtin.git_files, { desc = 'Telescope git files' })
    vim.keymap.set('n', '<leader>fS', builtin.grep_string, { desc = 'Telescope current selection' })


    -- <leader>fz : Search only .zig files in the CURRENT project/directory
    vim.keymap.set('n', '<leader>fz', function()
      builtin.live_grep({
        glob_pattern = "*.zig",        -- Only include .zig files
        prompt_title = "Live Grep (Zig files only)",
      })
    end, { desc = "Telescope: Live grep in .zig files" })



    -- <leader>fZ : Live grep in the Zig standard library
    vim.keymap.set('n', '<leader>fZ', function()
      local zig_std_path = vim.fn.expand("~/.zig/zig/lib/std")

      -- Optional safety check
      if vim.fn.isdirectory(zig_std_path) == 0 then
        vim.notify("Zig stdlib not found at: " .. zig_std_path, vim.log.levels.ERROR)
        return
      end

      builtin.live_grep({
        cwd = zig_std_path,
        glob_pattern = "*.zig",
        prompt_title = "Live Grep — Zig Standard Library",
      })
    end, { desc = "Telescope: Live grep in Zig stdlib" })



  end
}

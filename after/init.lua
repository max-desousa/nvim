-- Example: Disable autoindent for C and header files
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "h"},
    callback = function()
        vim.bo.autoindent = false
    end,
})

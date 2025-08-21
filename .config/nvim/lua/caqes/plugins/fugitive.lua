return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
            vim.keymap.set("n", "]c", vim.cmd.cnext)
            vim.keymap.set("n", "[c", vim.cmd.cprev)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
    }
}

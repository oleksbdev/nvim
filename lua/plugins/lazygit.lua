return {
    {
        "kdheepak/lazygit.nvim",
        dependencies =  {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("telescope").load_extension("lazygit")
            vim.keymap.set("n", "<leader>lgg", ":LazyGit<CR>", {})
            vim.keymap.set("n", "<leader>lgcf", ":LazyGitCurrentFile<CR>", {})
        end,
    },
}

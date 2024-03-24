return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = { 
                "lua", 
                "vim",
                "python", 
                "sql", 
                "dockerfile", 
                "bash", 
                "gitignore", 
                "json", 
                "javascript", 
                "mermaid", 
                "markdown_inline",
                "scala", 
                "java", 
                "yaml", 
                "xml",
            },
        })
        end
    }
}


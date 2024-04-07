return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local on_attach = function(client, bufnr)
        local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
        local opts = { noremap = true, silent = true }

        buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_type_definitions<CR>', opts)
        buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
        buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
        buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
        buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
        buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
        buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.codelens.run()<cr>', opts)
        buf_set_keymap('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        client.server_capabilities.document_formatting = true
      end


      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
      lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities})

      -- lspconfig.tsserver.setup({ capabilities = capabilities })
      -- lspconfig.solargraph.setup({ capabilities = capabilities })
      -- lspconfig.html.setup({ capabilities = capabilities })

      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      -- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
-- return {
--     {
--         "williamboman/mason.nvim",
--         config = function()
--             require("mason").setup({
--                 PATH = "skip",
--             })
--         end
--     },
--     {
--         "williamboman/mason-lspconfig.nvim",
--         config = function()
--             require("mason-lspconfig").setup({
--                 -- automatic_installation = true,
--                 insure_installed = {
--                     "lua_ls",
--                     -- "tsserver",
--                     "pyright",
--                     -- "dockerls",
--                     -- "docker_compose_language_service",
--                     -- "jsonls",
--                     -- "marksman",
--                     -- "spectral",
--                     -- "sqls",
--                     -- "lemminx",
--                     -- "yamlls",
--                     -- "autotools_ls",
--                     -- "bashls",
--                 }
--             })
--         end
--     },
--     {
--         "neovim/nvim-lspconfig",
--         config = function()
--             -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--             local lspconfig = require('lspconfig')

--             lspconfig.lua_ls.setup({  })
--             -- lspconfig.tsserver.setup({  })
--             -- lspconfig.pyright.setup({  })
--             -- lspconfig.dockerls.setup({  })
--             -- lspconfig.docker_compose_language_service.setup({  })
--             -- lspconfig.jsonls.setup({  })
--             -- lspconfig.marksman.setup({  })
--             -- lspconfig.spectral.setup({  })
--             -- lspconfig.sqls.setup({  })
--             -- lspconfig.lemminx.setup({  })
--             -- lspconfig.yamlls.setup({  })
--             -- lspconfig.autotools_ls.setup({  })
--             -- lspconfig.bashls.setup({  })

--             vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
--             vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
--             vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
--             vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
--             vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
--         end
--     }
-- }

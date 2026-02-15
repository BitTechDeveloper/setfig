return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        lspconfig.emmet_language_server.setup({})
        lspconfig.ts_ls.setup({})
        lspconfig.jsonls.setup({})
        lspconfig.vtsls.setup({})
        lspconfig.deno.setup({})
        lspconfig.pylsp.setup({})
        lspconfig.ruff.setup({})
        -- lspconfig.pyright.setup({})
        lspconfig.sqls.setup({})
        lspconfig.html.setup({})
        lspconfig.cssls.setup({})
        lspconfig.tailwindcss.setup({})
        lspconfig.graphql.setup({})
        lspconfig.lua_ls.setup({})
        lspconfig.yamlls.setup({})
        lspconfig.bashls.setup({})
        lspconfig.dockerls.setup({})
        lspconfig.docker_compose_language_service.setup({})
        lspconfig.terraformls.setup({})
        lspconfig.clangd.setup({})
    end,

    ---@class PluginLspOpts
    opts = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

        local servers = {
            -- pyright will be automatically installed with mason and loaded with lspconfig
            emmet_language_server = {},
            html = {},
            cssls = {},
            vtsls = {},
            -- pyright = {},
            -- pylsp = {},

            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            mccabe = { enabled = false },
                            pylsp_mypy = { enabled = false },
                            pylsp_black = { enabled = false },
                            pylsp_isort = { enabled = false },
                        },
                    },
                },
            },

            ruff = {
                -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
                -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
                commands = {
                    RuffAutofix = {
                        function()
                            vim.lsp.buf.execute_command({
                                command = "ruff.applyAutofix",
                                arguments = {
                                    { uri = vim.uri_from_bufnr(0) },
                                },
                            })
                        end,
                        description = "Ruff: Fix all auto-fixable problems",
                    },
                    RuffOrganizeImports = {
                        function()
                            vim.lsp.buf.execute_command({
                                command = "ruff.applyOrganizeImports",
                                arguments = {
                                    { uri = vim.uri_from_bufnr(0) },
                                },
                            })
                        end,
                        description = "Ruff: Format imports",
                    },
                },
            },
            sqls = {},
            ts_ls = {},
            deno = {},
            jsonls = {},
            terraformls = {},
            yamlls = {},
            bashls = {},
            tailwindcss = {},
            graphql = {},
            dockerls = {},
            clangd = {},
            docker_compose_language_service = {},
        }
    end,
}

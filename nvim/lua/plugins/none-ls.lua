return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
        "L3MON4D3/LuaSnip",
    },

    config = function()
        -- list of formatters & linters for mason to install
        require("mason-null-ls").setup({
            ensure_installed = {
                "codespell",
                "commitlint",
                "cppcheck",
                "djlint",
                "dotenv_linter",
                "hadolint",
                "markdownlint",
                "markuplint",
                "mdl",
                "mypy",
                "pylint",
                "stylint",
                "yamllint",
                "zsh",
                "codespell",
                "shfmt",
                "stylelint",
                "mdformat",
                "yamlfix",
                "stylua",
                "clang_format",
                "prettier",
                "biome",
                "isort",
                "black",
                "sqlfluff",
                "sqruff",
                "pg_format",
                "sqlfmt",
                "sql-formatter",
            },
            -- auto-install configured formatters & linters (with null-ls)
            automatic_installation = true,
        })
        local null_ls = require("null-ls")
        null_ls.setup({
            debug = true,
            sources = {
                -- null_ls.builtins.completion.spell,
                null_ls.builtins.completion.luasnip,
                null_ls.builtins.completion.nvim_snippets,
                null_ls.builtins.completion.tags,

                -- null_ls.builtins.diagnostics.codespell,
                null_ls.builtins.diagnostics.commitlint,
                null_ls.builtins.diagnostics.cppcheck,
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.diagnostics.dotenv_linter,
                null_ls.builtins.diagnostics.hadolint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.markuplint,
                null_ls.builtins.diagnostics.mdl,
                null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.diagnostics.pylint,
                -- null_ls.builtins.diagnostics.sqlfluff,
                null_ls.builtins.diagnostics.sqruff,
                null_ls.builtins.diagnostics.stylint,
                null_ls.builtins.diagnostics.yamllint,
                null_ls.builtins.diagnostics.zsh,

                -- null_ls.builtins.formatting.codespell,
                null_ls.builtins.formatting.shfmt.with({ args = { "-i", "4" } }),
                null_ls.builtins.formatting.stylelint,
                null_ls.builtins.formatting.mdformat,
                null_ls.builtins.formatting.yamlfix,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.formatting.prettier.with({
                    extra_args = { "--tab-width", "4" },
                }),
                -- null_ls.builtins.formatting.biome,
                -- null_ls.builtins.formatting.isort,
                -- null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.sqlfluff.with({
                --    extra_args = { "--dialect", "postgres" }, -- change to your dialect
                -- }),
                -- null_ls.builtins.formatting.pg_format,
                null_ls.builtins.formatting.sqruff,
                null_ls.builtins.formatting.sqlfmt,
                -- null_ls.builtins.formatting.sqlformat,
                -- null_ls.builtins.diagnostics.eslint_d, -- Use built-in eslint_d
                -- null_ls.builtins.formatting.ruff, -- Use built-in ruff
                -- null_ls.builtins.formatting.ruff_format, -- Use built-in ruff formatter
                require("none-ls.diagnostics.eslint"),
                require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
                require("none-ls.formatting.ruff_format"),

                null_ls.builtins.hover.dictionary,
                null_ls.builtins.hover.printenv,
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

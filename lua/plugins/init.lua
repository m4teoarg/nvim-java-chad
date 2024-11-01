return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require("configs.conform"),
    },
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lspconfig")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "python",
                "tsx",
                "java",
            },
        },
    },

    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            view = {
                side = "left",
                width = 30,
            },
        },
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },

    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require("configs.lspconfig")
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },

    { "nvchad/timerly", cmd = "TimerlyToggle" },

    {
        "mfussenegger/nvim-dap",
        config = function()
            require("configs.dap")
        end,
    },
    --
    {
        "nvim-neotest/nvim-nio",
    },

    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require("configs.dap-ui")
        end,
    },

    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("configs.dap-python")
        end,
    },

    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            require("configs.dap-java")
        end,
    },

    { "rcarriga/nvim-notify" },

    {
        "supermaven-inc/supermaven-nvim",
        event = "LspAttach",
        opts = {
            keymaps = {
                accept_suggestion = "<C-j>",
                clear_suggestion = "<C-x>",
                accept_word = "<C-y>",
            },
            disable_keymaps = false,
            log_level = "warn",
            dsable_inline_completion = false,
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = "VeryLazy",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.icons",
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        -- build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    {
        "grapp-dev/nui-components.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = { "html", "css", "cssls", "javascript", "typescript" },
                    }),
                },
            })
        end,
    },
    {
        "dense-analysis/ale",
        event = "BufRead",
        -- lazy = "VeryLazy",
        config = function()
            -- Habilitar linter para HTML
            vim.g.ale_linters = {
                html = { "htmlhint" },
            }
            -- Configuraciones adicionales
            vim.g.ale_lint_on_text_changed = "always"
            vim.g.ale_lint_on_insert_leave = 1
        end,
    },
    --#region
    -- none-ls.nvim
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- null_ls.builtins.diagnostics.stylua,
                    -- null_ls.builtins.diagnostics.htmlhint,
                    null_ls.builtins.formatting.prettier.with({
                        filetypes = { "html", "css", "javascript", "typescript" },
                    }),
                },
            })
        end,
    },
    --#endregion
}

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
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
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

    {
        "nvim-neotest/nvim-nio",
    },

    {
        "rcarriga/nvim-dap-ui",
        dofile(vim.g.base46_cache .. "dap"),
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
        lazy = false,
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.icons",
        },
        config = function()
            require("render-markdown").setup({})
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
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
    -- none-ls.nvim
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvimtools/none-ls-extras.nvim",
        },
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            local sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.google_java_format,
                null_ls.builtins.formatting.golines,
                null_ls.builtins.diagnostics.checkstyle.with({
                    extra_args = { "-c", vim.fn.expand("$HOME/.config/checkstyle/google_checks.xml") },
                    filetypes = { "java" },
                }),
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "html", "css", "javascript", "typescript" },
                }),
            }

            null_ls.setup({
                debug = true,
                timeout = 8000, -- Configurar timeout en milisegundos (5 segundos)
                sources = sources,
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })

            -- Mapear tecla para formatear el archivo manualmente
            vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
        end,
    },

    --#endregion
    { "echasnovski/mini.nvim", version = "*" },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            "tpope/vim-dadbod",
            "kristijanhusak/vim-dadbod-completion",
        },
        event = "VimEnter",
        config = function()
            -- Configurar vim-dadbod-ui
            vim.g.db_ui_use_nerd_fonts = 1
            -- Definir conexión a MariaDB
            vim.g.dbs = { { name = "c_mariadb", url = "mysql://mateo:mateo123@localhost/users" } }
        end,
    },
}

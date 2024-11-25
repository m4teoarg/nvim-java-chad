-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",
    -- changed_themes = {
    --     catppuccin = {
    --         base16 = { base00 = "#1e1e2e" },
    --         base_30 = {
    --             red = "#F38BA8",
    --             black2 = "#1e1e2e",
    --         },
    --     },
    --     onedark = { ... },
    -- },

    integrations = { "dap" },

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

-- vim.cmd("autocmd VimEnter * lua dofile(vim.g.base46_cache .. 'dap')")

M.ui = {
    tabufline = {
        lazyload = false,
    },
    statusline = {
        theme = "default",
        separator_style = "default",
        -- order = { "mode", "f", "git", "%=", "lsp_msg", "%=", "lsp", "cwd" },
    },
}

M.nvdash = {
    load_on_startup = false,
    header = {
        "                            ",
        "     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
        "   ▄▀███▄     ▄██ █████▀    ",
        "   ██▄▀███▄   ███           ",
        "   ███  ▀███▄ ███           ",
        "   ███    ▀██ ███           ",
        "   ███      ▀ ███           ",
        "   ▀██ ███    ███           ",
        "     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
        "                            ",
        "     Powered By  eovim    ",
        "                            ",
    },
    buttons = {
        { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
        -- more... check nvconfig.lua file for full list of buttons
    },
}

M.lsp = {
    signature = false,
}

M.colorify = {
    enabled = true,
    mode = "virtual",
    virt_text = "󱓻 ",
    highlight = {
        hex = true,
        lspvars = true,
    },
}

M.cmd = {
    border = false,
}

return M

-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",
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
        separator_style = "block",
    },
}

M.nvdash = {
    load_on_startup = true,
}

M.lsp = {
    signature = true,
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

return M

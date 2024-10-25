-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}

M.nvdash = {
  load_on_startup = false,
}

M.lsp = {
  diagnostics = {
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  },
}

-- M.mason = {
--   pkgs = {
--     "typescript-language-server",
--     "lua-language-server",
--     "eslint-lsp",
--     "prettierd",
--     "pyright",
--   },
-- }

return M

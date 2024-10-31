-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  integrations = { "dap" },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DapBreakpoint = { fg = { "pink", 2 } },
    DapStopped = { fg = { "red", 2 } },
    DapBreakpointRejected = { fg = { "red", 2 } },
    DapLogPoint = { fg = { "red", 2 } },
  },
}

M.ui = {
  tabufline = {
    lazyload = false,
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

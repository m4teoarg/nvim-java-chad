local map = vim.keymap.set

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })

map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })

vim.cmd("hi DapBreakpointColor guifg=#ff5500")
vim.cmd("hi DapStoppedColor guifg=#417b15")

vim.fn.sign_define(
    "DapBreakpoint",
    { text = "", texthl = "DapBreakpointColor", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

vim.fn.sign_define(
  "DapStopped",
  { text = "", texthl = "DapStoppedColor", linehl = "DapStopped", numhl = "DapStopped" }
)

-- vim.fn.sign_define(
--   "DapLogPoint",
--   { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
-- )
--
-- vim.fn.sign_define(
--   "DapBreakpointRejected",
--   { text = "", texthl = "DapBreakpointRejected", linehl = "DapBreakpointRejected", numhl = "DapBreakpointRejected" }
-- )


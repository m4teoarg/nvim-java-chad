local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- definir snippets
ls.add_snippets("python", {
  -- snippet para una declaracion de importacion
  s("myimp", {
    t("import "), i(1, "module")
  }),

  -- snippet para definicinon de funcion
  s("mydef", {
    t("def "), i(1, "function_name"), t("("), i(2, "args"), t("):"),
    t({"", "    "}), i(3, "pass")
  }),
})

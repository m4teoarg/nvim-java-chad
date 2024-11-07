local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Configura google-java-format como formateador
        null_ls.builtins.formatting.google_java_format,
    },
})

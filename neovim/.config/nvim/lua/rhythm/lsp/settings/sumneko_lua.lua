-- don't warn that "vim" is a undefined global
return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}


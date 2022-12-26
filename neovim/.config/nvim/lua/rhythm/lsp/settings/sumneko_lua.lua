-- don't warn that "vim" is an undefined global
return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
}


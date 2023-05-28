require("bufferline").setup{
    options = {
        mode = "tabs",
        tab_size = 25,
        indicator = {
--            style = 'underline',
            icon = '▎',
            style = 'icon',
        },
        offsets = { {
            filetype = "NvimTree",
            text = "",
            padding = 1,
        } },
    },
}

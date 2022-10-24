vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, _ = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    open_on_tab = true,
    hijack_cursor = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    actions = {
        change_dir = {
            enable = true,
            global = true,
        },
    },
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                file = false,
                folder_arrow = false,
            },
            glyphs = {
                folder = {
                    default = "▸",
                    open = "▾",
                    empty = "▸",
                    empty_open = "▾",
                },
            },
        },
    },
    git = {
        enable = true,
        ignore = true,
    },
    view = {
        mappings = {
            list = {
                { key = "gs", action = "vsplit" },
                { key = "gi", action = "split" },
                { key = "go", action = "preview" },
                { key = "T", action = "tabnew" },
                { key = "x", action = "close_node" },
                { key = "O", action = "expand_all" },
                { key = "C", action = "cd" },
            },
        },
    },
}


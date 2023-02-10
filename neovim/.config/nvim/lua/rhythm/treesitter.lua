local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = {
        "bash",
        "c",
-- this needs tree-sitter-cli and node
--        "devicetree",
        "gitattributes",
-- this needs node
--        "gitignore",
        "latex",
        "lua",
        "make",
        "markdown",
        "python",
        "rust",
        "toml",
        "vim"
    },
    sync_install = false,
    ignore_install = {""},
    highlight = {
        enable = true,
        disable = {""},
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = {""} },
}


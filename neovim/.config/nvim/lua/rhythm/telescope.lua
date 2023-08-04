local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
        initial_mode = "normal",
--        prompt_prefix = "",
--        selection_caret = "",
        path_display = { "truncate" },
--                shorten = { len = 5 },
--                "absolute",
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            },
            n = {
                ["q"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["gi"] = actions.select_horizontal,
                ["gs"] = actions.select_vertical,
                ["T"] = actions.select_tab,
            },
        },
    },
    extensions = {
        file_browser = {
            cwd_to_path = true,
            -- theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                  -- your custom insert mode mappings
                },
                ["n"] = {
                  -- your custom normal mode mappings
                    ['a'] = fb_actions.create,
                    ['-'] = fb_actions.goto_cwd,
                    ['C'] = fb_actions.change_cwd,
                    ['~'] = fb_actions.goto_home_dir,
                    ['\\'] = fb_actions.goto_parent_dir,
                },
            },
        },
    },
    pickers = {
        colorscheme = {
            enable_preview = true,
        },
    },
}

require("telescope").load_extension "file_browser"

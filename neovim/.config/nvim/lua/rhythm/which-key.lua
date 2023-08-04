local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

wk.setup {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜ ", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = ',', -- binding to scroll down inside the popup
        scroll_up = '.', -- binding to scroll up inside the popup
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 10, -- spacing between columns
        align = "center", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
}

wk.register({
    ["="] = {
        name = "Telescope & Trouble",
        f = { "<cmd>Telescope find_files<CR>", "Find File" },
        F = { "<cmd>Telescope find_files hidden=true<CR>", "Find File hidden" },
        g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
        G = { "<cmd>Telescope live_grep cwd=", "Live Grep at" },
        s = { "<cmd>Telescope grep_string<CR>", "Grep String" },
        b = { "<cmd>Telescope file_browser<CR>", "Browse File" },
        c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
        ["="] = { "<cmd>TroubleToggle<CR>", "Trouble" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Trouble Workspace" },
        d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Trouble Document" },
        q = { "<cmd>TroubleToggle quickfix<CR>", "Trouble Quickfix" },
        l = { "<cmd>TroubleToggle loclist<CR>", "Trouble Location" },
    },
    ["z"] = {
        name = "cscope",
        s = {":Cscope find s <C-R>=expand('<cword>')<CR><CR>", "References to this symbol"},
        g = {":Cscope find g <C-R>=expand('<cword>')<CR><CR>", "Definition"},
        c = {":Cscope find c <C-R>=expand('<cword>')<CR><CR>", "Calls to this symbol"},
        t = {":Cscope find t <C-R>=expand('<cword>')<CR><CR>", "Text"},
        e = {":Cscope find e <C-R>=expand('<cword>')<CR><CR>", "Egrep"},
        f = {":Cscope find f <C-R>=expand('<cfile>')<CR><CR>", "File"},
        i = {":Cscope find i <C-R>=expand('<cfile>')<CR><CR>", "Includes"},
        d = {":Cscope find d <C-R>=expand('<cword>')<CR><CR>", "Functions that this symbol calls"},
        a = {":Cscope find a <C-R>=expand('<cword>')<CR><CR>", "Places this symbol gets assigned"},
        m = {":ZenMode<CR>:set scroll=1<CR>", "Zen Mode"},
        n = {":Twilight<CR>", "Twilight"},
    },
    ["m"] = {
        name = "LSP",
        d = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
        g = {"<cmd>lua vim.lsp.buf.definition()<CR>", "Definition"},
        h = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover"},
        i = {"<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation"},
        u = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help"},
        s = {"<cmd>Telescope lsp_references show_line=false<CR>", "References"},
        S = {"<cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls"},
        r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename"},
        o = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Open Float"},
        n = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "Goto Next Diagnostic"},
        p = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "Goto Prev Diagnostic"},
        a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions"},
        e = {"<cmd>lua Start_standalone_rust_client()<CR>", "rust-analyzer standalone"},
        t = {"<cmd>Telescope lsp_type_definitions show_line=false<CR>", "Type Definition"},
    },
})

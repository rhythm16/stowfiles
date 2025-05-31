local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    return
end

wk.setup {
    preset = "modern",
    triggers = {
        { "m", mode = {"n"} },
        { "=", mode = {"n"} },
        { "z", mode = {"n"} },
    },
}

wk.add({
    { "m", group = "LSP" },
    { "mS", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", desc = "Incoming Calls" },
    { "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
    { "md", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
    { "me", "<cmd>lua Start_standalone_rust_client()<CR>", desc = "rust-analyzer standalone" },
    { "mg", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
    { "mh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
    { "mi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
    { "mn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Goto Next Diagnostic" },
    { "mo", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open Float" },
    { "mp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Goto Prev Diagnostic" },
    { "mr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
    { "ms", "<cmd>Telescope lsp_references show_line=false<CR>", desc = "References" },
    { "mt", "<cmd>Telescope lsp_type_definitions show_line=false<CR>", desc = "Type Definition" },
    { "mu", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
})
wk.add({
    { "=", group = "Telescope, Trouble, and Blame" },
    { "==", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble" },
    { "=F", "<cmd>Telescope find_files hidden=true<CR>", desc = "Find File hidden" },
    { "=G", "<cmd>Telescope live_grep cwd=", desc = "Live Grep at" },
    { "=b", "<cmd>Telescope file_browser<CR>", desc = "Browse File" },
    { "=c", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
    { "=f", "<cmd>Telescope find_files<CR>", desc = "Find File" },
    { "=g", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    { "=l", "<cmd>Trouble loclist toggle<CR>", desc = "Trouble Location" },
    { "=q", "<cmd>Trouble qflist toggle<CR>", desc = "Trouble Quickfix" },
    { "=s", "<cmd>Telescope grep_string<CR>", desc = "Grep String" },
    { "=y", "<cmd>Trouble symbols toggle<CR>", desc = "Trouble Symbols" },
    { "=i", "<cmd>BlameToggle<CR>", desc = "Git Blame" },
})
wk.add({
    { "z", group = "cscope" },
    { "zc", ":Cscope find c <C-R>=expand('<cword>')<CR><CR>", desc = "Calls to this symbol" },
    { "zd", ":Cscope find d <C-R>=expand('<cword>')<CR><CR>", desc = "Functions that this symbol calls" },
    { "ze", ":Cscope find e <C-R>=expand('<cword>')<CR><CR>", desc = "Egrep" },
    { "zf", ":Cscope find f <C-R>=expand('<cfile>')<CR><CR>", desc = "File" },
    { "zg", ":Cscope find g <C-R>=expand('<cword>')<CR><CR>", desc = "Definition" },
    { "zi", ":Cscope find i <C-R>=expand('<cfile>')<CR><CR>", desc = "Includes" },
    { "zm", ":ZenMode<CR>:set scroll=1<CR>", desc = "Zen Mode" },
    { "zn", ":Twilight<CR>", desc = "Twilight" },
    { "zs", ":Cscope find s <C-R>=expand('<cword>')<CR><CR>", desc = "References to this symbol" },
    { "zt", ":Cscope find t <C-R>=expand('<cword>')<CR><CR>", desc = "Text" },
    { "zx", ":Cscope find a <C-R>=expand('<cword>')<CR><CR>", desc = "Places this symbol gets assigned" },
})

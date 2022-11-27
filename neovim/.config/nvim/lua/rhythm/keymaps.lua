local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "H", "<C-w>h", opts)
keymap("n", "J", "<C-w>j", opts)
keymap("n", "K", "<C-w>k", opts)
keymap("n", "L", "<C-w>l", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "=f", ":Telescope find_files<CR>", opts)
keymap("n", "=F", ":Telescope find_files cwd=", opts)
keymap("n", "=g", ":Telescope live_grep<CR>", opts)
keymap("n", "=G", ":Telescope live_grep cwd=", opts)
keymap("n", "=s", ":Telescope grep_string<CR>", opts)

keymap("n", "zs", ":cs find s <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zg", ":cs find g <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zc", ":cs find c <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zt", ":cs find t <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "ze", ":cs find e <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zf", ":cs find f <C-R>=expand('<cfile>')<CR><CR>", opts)
keymap("n", "zi", ":cs find i <C-R>=expand('<cfile>')<CR><CR>", opts)
keymap("n", "zd", ":cs find d <C-R>=expand('<cword>')<CR><CR>", opts)

keymap("n", "<F2>", ":LspStart<CR>:echo \"Lsp started!\"<CR>", opts)
keymap("n", "<F3>", ":LspStop<CR>:echo \"Lsp stopped!\"<CR>", opts)
keymap("n", "<F7>", ":NERDTreeToggle<CR>", opts)
keymap("n", "<F8>", ":TagbarToggle<CR>", opts)
keymap("n", "<F9>", ":NvimTreeToggle<CR>:wincmd p<CR>", opts)

keymap("n", "[[", ":tabe<CR>", opts)
keymap("n", "]]", ":tabc<CR>", opts)

keymap("n", "\\", ":cd ..<CR>:NvimTreeToggle<CR>:NvimTreeToggle<CR>:wincmd p<CR>", opts)
keymap("n", "-", ":pwd<CR>", opts)

-- below is colorscheme cycling!
Colors = vim.fn.getcompletion('', 'color')
-- the initial index and the color should be in sync
-- but it's not a big inconvenience if they aren't though
Cur_color_index = 3
vim.cmd([[colorscheme codedark]])

function Next_color()
    Cur_color_index = Cur_color_index + 1
    if Cur_color_index > vim.fn.len(Colors) then Cur_color_index = 1 end
    local a = "colorscheme "
    local b = Colors[Cur_color_index]
    vim.cmd(a .. b)
    vim.notify(b .. " " .. tostring(Cur_color_index))
    vim.cmd("NvimTreeToggle")
    vim.cmd("NvimTreeToggle")
    vim.cmd("wincmd p")
end

function Prev_color()
    Cur_color_index = Cur_color_index - 1
    if Cur_color_index == 0 then Cur_color_index = vim.fn.len(Colors) end
    local a = "colorscheme "
    local b = Colors[Cur_color_index]
    vim.cmd(a .. b)
    vim.notify(b .. " " .. tostring(Cur_color_index))
    vim.cmd("NvimTreeToggle")
    vim.cmd("NvimTreeToggle")
    vim.cmd("wincmd p")
end

keymap("n", "<C-n>", "", { callback = Next_color })
keymap("n", "<C-p>", "", { callback = Prev_color })
-- end colorscheme cycline!


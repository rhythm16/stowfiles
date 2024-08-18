local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- window resizing
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
keymap("n", ",", ":set scroll=1<CR><C-d>:set scroll=1<CR>", opts)
keymap("n", ".", ":set scroll=1<CR><C-u>:set scroll=1<CR>", opts)

-- escape
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- telescope
keymap("n", "=f", ":Telescope find_files<CR>", opts)
keymap("n", "=F", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "=g", ":Telescope live_grep<CR>", opts)
keymap("n", "=s", ":Telescope grep_string<CR>", opts)
keymap("n", "=b", ":Telescope file_browser<CR>", opts)
keymap("n", "=c", ":Telescope colorscheme<CR>", opts)

-- flash
keymap("n", "s", "<cmd>lua require(\"flash\").jump()<CR>", opts)

-- cscope
keymap("n", "zs", '<cmd>Cscope find s vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zg", '<cmd>Cscope find g vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zc", '<cmd>Cscope find c vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zt", '<cmd>Cscope find t vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "ze", '<cmd>Cscope find e vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zf", '<cmd>Cscope find f vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zi", '<cmd>Cscope find i vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zd", '<cmd>Cscope find d vim.fn.expand("<cword>"))<CR>', opts)
keymap("n", "zx", '<cmd>Cscope find a vim.fn.expand("<cword>"))<CR>', opts)

-- lsp
keymap("n", "<F2>", ":LspStart<CR>:lua vim.notify(\" Lsp started!\", vim.log.levels.INFO, { title = \" LSP\",})<CR>", opts)
keymap("n", "<F3>", ":LspStop<CR>:lua vim.notify(\" Lsp stopped!\", vim.log.levels.WARN, { title = \" LSP\",})<CR>", opts)

-- UI
keymap("n", "<F4>", ":lua vim.opt.listchars = { tab = '> ' , trail = '¬', nbsp = '+' }<CR>:set nu<CR>", opts)
keymap("n", "<F5>", ":lua vim.opt.listchars = { tab = '  ' , trail = '¬', nbsp = '+' }<CR>:set nonu<CR>", opts)
keymap("n", "<F7>", ":NERDTreeToggle<CR>", opts)
keymap("n", "<F8>", ":AerialToggle!<CR>", opts)
keymap("n", "<F9>", ":NvimTreeToggle<CR>:wincmd p<CR>", opts)
keymap("n", "zm", ":ZenMode<CR>:set scroll=1<CR>", opts)
keymap("n", "zn", ":Twilight<CR>", opts)

-- tabs
keymap("n", "[[", ":tabe<CR>", opts)
keymap("n", "]]", ":tabclose<CR>", opts)
keymap("n", "gn", ":tabnext<CR>", opts)
keymap("n", "gp", ":tabprevious<CR>", opts)

-- buffers
keymap("n", "gN", ":bnext<CR>", opts)
keymap("n", "gP", ":bprevious<CR>", opts)
keymap("n", "gD", ":bdelete<CR>:bnext<CR>", opts)

-- trouble
keymap("n", "==", ":Trouble diagnostics toggle<CR>", opts)
keymap("n", "=y", ":Trouble symbols toggle<CR>", opts)
keymap("n", "=q", ":Trouble quickfix toggle<CR>", opts)
keymap("n", "=l", ":Trouble loclist toggle<CR>", opts)

-- working directory
keymap("n", "\\", ":cd ..<CR>:NvimTreeToggle<CR>" ..
                  ":NvimTreeToggle<CR>" ..
                  ":wincmd p<CR>" ..
                  ":lua local cwd = vim.fn.getcwd();" ..
                  "vim.notify(\" cwd moved up one level!\\n \"..cwd, vim.log.levels.INFO, { title = \" WORKING DIRECTORY\",})<CR>", opts)
keymap("n", "-", ":lua local cwd = vim.fn.getcwd(); vim.notify(\" \"..cwd, vim.log.levels.INFO, { title = \" CURRENT WORKING DIRECTORY\",})<CR>", opts)

-- below is colorscheme cycling!
Colors = vim.fn.getcompletion('', 'color')
-- the initial index and the color should be in sync
-- but it's not a big inconvenience if they aren't though
Cur_color_index = 7
vim.cmd([[colorscheme catppuccin-mocha]])

function Next_color()
    Cur_color_index = Cur_color_index + 1
    if Cur_color_index > vim.fn.len(Colors) then Cur_color_index = 1 end
    local a = "colorscheme "
    local b = Colors[Cur_color_index]
    vim.cmd(a .. b)
    vim.notify(" " .. b .. " " .. tostring(Cur_color_index), vim.log.levels.INFO, { title = " COLORSCHEME" })
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
    vim.notify(" " .. b .. " " .. tostring(Cur_color_index), vim.log.levels.INFO, { title = " COLORSCHEME" })
    vim.cmd("NvimTreeToggle")
    vim.cmd("NvimTreeToggle")
    vim.cmd("wincmd p")
end

keymap("n", "<C-n>", "", { callback = Next_color })
keymap("n", "<C-p>", "", { callback = Prev_color })
-- end colorscheme cycling!


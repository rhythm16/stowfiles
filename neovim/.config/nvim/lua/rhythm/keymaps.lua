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
keymap("n", ",", "<C-d>:set scroll=1<CR>", opts)
keymap("n", ".", "<C-u>:set scroll=1<CR>", opts)

-- escape
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- telescope
keymap("n", "=f", ":Telescope find_files<CR>", opts)
keymap("n", "=F", ":Telescope find_files cwd=", opts)
keymap("n", "=g", ":Telescope live_grep<CR>", opts)
keymap("n", "=G", ":Telescope live_grep cwd=", opts)
keymap("n", "=s", ":Telescope grep_string<CR>", opts)
keymap("n", "=b", ":Telescope file_browser<CR>", opts)

-- cscope
keymap("n", "zs", ":cs find s <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zg", ":cs find g <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zc", ":cs find c <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zt", ":cs find t <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "ze", ":cs find e <C-R>=expand('<cword>')<CR><CR>", opts)
keymap("n", "zf", ":cs find f <C-R>=expand('<cfile>')<CR><CR>", opts)
keymap("n", "zi", ":cs find i <C-R>=expand('<cfile>')<CR><CR>", opts)
keymap("n", "zd", ":cs find d <C-R>=expand('<cword>')<CR><CR>", opts)

-- lsp
keymap("n", "<F2>", ":LspStart<CR>:lua vim.notify(\" Lsp started!\", vim.log.levels.INFO, { title = \" LSP\",})<CR>", opts)
keymap("n", "<F3>", ":LspStop<CR>:lua vim.notify(\" Lsp stopped!\", vim.log.levels.WARN, { title = \" LSP\",})<CR>", opts)

-- UI
keymap("n", "<F4>", ":lua vim.opt.listchars = { tab = '> ' , trail = '??', nbsp = '+' }<CR>:set nu<CR>", opts)
keymap("n", "<F5>", ":lua vim.opt.listchars = { tab = '  ' , trail = '??', nbsp = '+' }<CR>:set nonu<CR>", opts)
keymap("n", "<F7>", ":NERDTreeToggle<CR>", opts)
keymap("n", "<F8>", ":TagbarToggle<CR>", opts)
keymap("n", "<F9>", ":NvimTreeToggle<CR>:wincmd p<CR>", opts)
keymap("n", "zm", ":ZenMode<CR>:set scroll=1<CR>", opts)
keymap("n", "zn", ":Twilight<CR>", opts)

-- tabs
keymap("n", "[[", ":tabe<CR>", opts)
keymap("n", "]]", ":tabc<CR>", opts)

-- trouble
keymap("n", "==", ":TroubleToggle<CR>", opts)
keymap("n", "=w", ":TroubleToggle workspace_diagnostics<CR>", opts)
keymap("n", "=d", ":TroubleToggle document_diagnostics<CR>", opts)
keymap("n", "=q", ":TroubleToggle quickfix<CR>", opts)
keymap("n", "=l", ":TroubleToggle loclist<CR>", opts)

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
Cur_color_index = 3
vim.cmd([[colorscheme codedark]])

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
-- end colorscheme cycline!


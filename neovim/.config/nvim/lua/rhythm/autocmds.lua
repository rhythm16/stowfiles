-- open nerdtree upon open
-- vim.cmd [[
--     augroup NERD
--         autocmd!
--         autocmd VimEnter * NERDTree
--         autocmd VimEnter * wincmd p
--     augroup end
-- ]]

-- close quickfix when CR is hit
-- and make the quickfix window larger
vim.cmd [[
autocmd FileType qf nmap <buffer> <CR> <CR>:ccl<CR>
autocmd FileType qf 12wincmd_
]]

-- disable neovim mouse
vim.cmd [[
    set mouse=
]]

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- yanks to system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")

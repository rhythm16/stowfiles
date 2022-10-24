-- open nerdtree upon open
-- vim.cmd [[
--     augroup NERD
--         autocmd!
--         autocmd VimEnter * NERDTree
--         autocmd VimEnter * wincmd p
--     augroup end
-- ]]

vim.cmd [[
    if filereadable("cscope.out")
        cs add cscope.out
    endif
]]

-- close quickfix when CR is hit
vim.cmd [[
autocmd FileType qf nmap <buffer> <CR> <CR>:ccl<CR>
]]


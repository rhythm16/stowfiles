-- open nerdtree upon open
-- vim.cmd [[
--     augroup NERD
--         autocmd!
--         autocmd VimEnter * NERDTree
--         autocmd VimEnter * wincmd p
--     augroup end
-- ]]

vim.cmd [[
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag
    " check cscope definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0
    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    " show msg when any other cscope db added
    set cscopeverbose
]]

-- close quickfix when CR is hit
vim.cmd [[
autocmd FileType qf nmap <buffer> <CR> <CR>:ccl<CR>
]]


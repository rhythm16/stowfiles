-- load cscope maps
-- pass empty table to setup({}) for default options
require('cscope_maps').setup({
  disable_maps = false, -- true disables my keymaps, only :Cscope will be loaded
  cscope = {
    db_file = "./cscope.out", -- location of cscope db file
    exec = "cscope", -- "cscope" or "gtags-cscope"
    use_telescope = false, -- true will show results in telescope picker
    db_build_cmd = { args = { "-Rbqk" }, }, -- args used for db build (:Cscope build)
  },
})

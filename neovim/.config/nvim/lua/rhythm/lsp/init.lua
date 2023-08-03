-- mason strongly recommends this setup order
require("mason").setup()
require("mason-lspconfig").setup()
require("rhythm.lsp.handlers").setup()
require("mason-lspconfig").setup_handlers {
-- The first entry (without a key) will be the default handler
-- and will be called for each installed server that doesn't have
-- a dedicated handler.
    function (server_name) -- default handler (optional)
        local opts = {
            on_attach = require("rhythm.lsp.handlers").on_attach,
            capabilities = require("rhythm.lsp.handlers").capabilities,
        }
        -- server specific opts
        if server_name == "lua_ls" then
             local lua_ls_opts = require("rhythm.lsp.settings.lua_ls")
             opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
        end
        require("lspconfig")[server_name].setup(opts)
    end,
-- Next, you can provide targeted overrides for specific servers.
-- For example, a handler override for the `rust_analyzer`:
-- ["rust_analyzer"] = function ()
--     require("rust-tools").setup {}
-- end
}

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- THIS PART IS HACKY:
-- copied https://github.com/simrat39/rust-tools.nvim/wiki/Standalone-File-Support
-- for standalone rust-analyzer to work
function Start_standalone_rust_client()
  local config = {
    root_dir = require("lspconfig.util").path.dirname(
      vim.api.nvim_buf_get_name(0)
    ),
    capabilities = require("rhythm.lsp.handlers").capabilities,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    init_options = { detachedFiles = { vim.api.nvim_buf_get_name(0) } },
    name = "rust_analyzer-standalone",
    on_init = function(client)
      local current_buf = vim.api.nvim_get_current_buf()
      vim.lsp.buf_attach_client(0, client.id)
      local on_attach = require("rhythm.lsp.handlers").on_attach
      if on_attach then
        on_attach(client, current_buf)
      end
    end,
--    handlers = rt.config.options.server.handlers,
  }

  vim.lsp.start_client(config)
end

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "me", "<cmd>lua Start_standalone_rust_client()<CR>", opts)
-- HACKY PART END

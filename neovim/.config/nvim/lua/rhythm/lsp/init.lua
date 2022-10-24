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
        if server_name == "sumneko_lua" then
             local sumneko_opts = require("rhythm.lsp.settings.sumneko_lua")
             opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
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


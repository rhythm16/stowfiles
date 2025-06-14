local fn = vim.fn

-- Automatically install packer
-- "data" means $HOME/.local/share/nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing pakcer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here

    -- infra
    use "wbthomason/packer.nvim"            -- Have packer manage itself
    use "nvim-lua/popup.nvim"               -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"             -- Useful lua funcitons used by lots of plugins

    -- nerdtree
    use "preservim/nerdtree"
    -- nvimtree
    use "nvim-tree/nvim-tree.lua"

    -- colors
    use "lunarvim/colorschemes"             -- Some colorschemes to try out
    use "tomasiser/vim-code-dark"           -- codedark colorscheme
    use "lunarvim/synthwave84.nvim"
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/nvim", as = "rose-pine" }
    use 'luisiacc/gruvbox-baby'
    use "ellisonleao/gruvbox.nvim"

    -- completion
    use "hrsh7th/nvim-cmp"                  -- The completion engine
    use "hrsh7th/cmp-buffer"                -- buffer completions
    use "hrsh7th/cmp-path"                  -- path completions
    use "hrsh7th/cmp-cmdline"               -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"          -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"              -- lsp completions
    use "hrsh7th/cmp-nvim-lua"              -- nvim lua config completions

    -- snippets
    use "L3MON4D3/LuaSnip"                  -- snippet engine
    use "rafamadriz/friendly-snippets"      -- a bunch of snippets for numerous languages

    -- lsp
    use "neovim/nvim-lspconfig"             -- enable LSP
    use "mason-org/mason.nvim"           -- language server installer
    use "mason-org/mason-lspconfig.nvim" -- helper plugin to smooth out the two above

    -- telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "nvim-treesitter/nvim-treesitter-context"

    -- flash
    use "folke/flash.nvim"

    -- git
    use "lewis6991/gitsigns.nvim"

    -- tagbar
    use "stevearc/aerial.nvim"

    -- zen mode
    use "folke/zen-mode.nvim"
    use "folke/twilight.nvim"

    -- nvim-notify
    use "rcarriga/nvim-notify"

    -- trouble
    use "nvim-tree/nvim-web-devicons"       -- required by trouble.nvim
    use "folke/trouble.nvim"                -- aggregates diagnostics, references, etc.

    -- which-key
    use "folke/which-key.nvim"

    -- cscope keymaps
    use 'dhananjaylatkar/cscope_maps.nvim'

    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

    -- cool animation
    use "eandrju/cellular-automaton.nvim"

    -- git blame in nvim
    use "FabijanZulj/blame.nvim"

    -- Automatically set up your config after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


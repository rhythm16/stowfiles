neovim config mainly adopted from the [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) series.

## Installation
```
sudo apt install stow git cscope
# rust & cargo
curl https://sh.rustup.rs -sSf | sh
cargo install bob-nvim
cargo install ripgrep
cargo install tree-sitter-cli
# bob install x.y.z
# bob use x.y.z
# bob use HASH (if on aarch64)
# install universal ctags

# other nice things:
cargo install zellij
cargo install bat
```

## Dependencies
* `ripgrep` (for telescope live-grep)
* universal ctags (for rust tagbar)
* tree-sitter cli (for tree-sitter)
* a [nerd font](https://www.nerdfonts.com/)

## Fixes
* `trouble.nvim` [PR](https://github.com/folke/trouble.nvim/pull/72)

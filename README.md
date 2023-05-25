neovim config mainly adopted from the [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) series.

## Installation
```
sudo apt install stow git cscope
# rust & cargo
curl https://sh.rustup.rs -sSf | sh
cargo install bob-nvim
cargo install ripgrep
# bob install x.y.z
# bob use x.y.z
# install universal ctags
```

## Dependencies
* `ripgrep` (for telescope live-grep)
* universal ctags (for rust tagbar)

## Fixes
* `trouble.nvim` [PR](https://github.com/folke/trouble.nvim/pull/72)

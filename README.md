neovim config mainly adopted from the [LunarVim/Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) series.

## Installation
```
# clone this repo
cd stowfiles
stow eww fish hypr kitty neovim neomutt
```

Go to https://github.com/neomutt/neomutt/tree/main/contrib/oauth2 , see how to use `mutt_oauth.py`, and generate a gmail token file.
The location of `mutt_oauth2.py` and the gmail token file must be as specified in `neomuttrc`.

## Dependencies
* `ripgrep` (for telescope live-grep)
* tree-sitter cli (for tree-sitter)
* a [nerd font](https://www.nerdfonts.com/)

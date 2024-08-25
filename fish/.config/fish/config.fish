set -g fish_greeting "Welcome to fish!"
set -x GPG_TTY $(tty)
set -x EDITOR nvim

# personal
alias pmail="neomutt -F ~/.config/neomutt/neomuttrc_personal"
# work
alias wmail="neomutt -F ~/.config/neomutt/neomuttrc_canonical"

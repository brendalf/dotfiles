set FZF_DEFAULT_COMMAND "fd --type f --hidden --follow --exclude .git"
set EDITOR "fish"

alias g git
alias b bat
alias cat bat
alias v nvim
alias t tmux
alias tm tmuxinator

if type -q exa
  alias ls "exa --icons"
  alias la "exa -a --icons"
  alias ll "exa -l -h --icons"
  alias lla "ll -a"
end

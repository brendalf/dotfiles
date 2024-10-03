set fish_greeting ""

alias n nvim
alias g git
alias gc gcloud
alias pr "poetry run"
alias v nvim
alias r ranger
alias t tmux
alias mux tmuxinator
alias k kubectl
alias kcx kubectx
alias kns kubens
alias gauth "gcloud auth login"
alias gauth-app "gcloud auth application-default login"

if type -q fzf
    fzf --fish | source
end

if type -q batcat
    alias b batcat
end

if type -q bat
    alias b bat
end

if type -q exa
    alias ls exa
    alias la "exa -a"
    alias ll "exa -l -h --icons"
    alias lla "ll -a"
end

# personal config
source ~/.config/fish/personal_config.fish

fish_vi_key_bindings

set --export --prepend PATH /opt/homebrew/bin
set -gx NVIM_DIR ~/.nvm

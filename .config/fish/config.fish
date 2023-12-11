set fish_greeting ""

alias n nvim
alias g git
alias gc gcloud
alias pr "poetry run"
alias v nvim
alias t tmux
alias mux tmuxinator
alias k kubectl
alias kcx kubectx
alias kns kubens
alias gauth "gcloud auth application-default login"

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

set --export --prepend PATH /Users/bbatistadasilva/bin
set --export --prepend PATH /Users/bbatistadasilva/go/bin
set --export --prepend PATH "/Users/bbatistadasilva/.cargo/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/bbatistadasilva/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

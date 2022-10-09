# general
set fish_greeting ""
set -gx EDITOR nvim

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias g git
alias v nvim
alias t tmux
alias mux tmuxinator

if type -q batcat
    alias b batcat
end

if type -q bat
    alias b bat
end

if type -q exa
  alias ls "exa"
  alias la "exa -a"
  alias ll "exa -l -h --icons"
  alias lla "ll -a"
end

# personal config
source ~/.config/fish/personal_config.fish

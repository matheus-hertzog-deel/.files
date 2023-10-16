set -gx PATH $PATH $HOME/.local/bin/
set fish_greeting ""

set -gx TERM_PROGRAM Alacritty.app

set -gx EDITOR nvim
set -gx VISUAL nvim

alias so "source $HOME/.config/fish/config.fish"

alias lg lazygit
alias aws "aws-mfa-secure session"

function fcd
    cd (fd . --type d $argv | fzf) && tmux new-session -As (pwd | sed "s/.*\///")
end

function tm
    command tmux new-session -As (pwd | sed "s/.*\///")
end

function colors
    sed \
        -e 's/INFO/\x1B[34mINFO\x1B[39m/' \
        -e 's/WARN/\x1B[33mWARN\x1B[39m/' \
        -e 's/ERROR/\x1B[31mERROR\x1B[39m/' 
end

set -g DOCKER_BUILDKIT 1

function npmLogin
    set -gx CODEARTIFACT_AUTH_TOKEN (aws codeartifact get-authorization-token --domain npm --domain-owner 221581667315 --query authorizationToken --output text --region eu-west-1)
end

function ecrLogin
    aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 221581667315.dkr.ecr.eu-west-1.amazonaws.com
end

alias prebuild "npmLogin && ecrLogin"

function gitCleanLocal
    git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
end

############


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/matheus/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

set -gx PATH $PATH /home/matheus/.local/bin/
set fish_greeting ""
set -gx EDITOR vim

alias so "source ~/.config/fish/config.fish"

alias tunnel_forward_dev "ssh -L 15432:deel-dev-1.cluster-cbxk4jeyvaog.eu-west-1.rds.amazonaws.com:5432 matheushertzog@bastion.deel.training"

alias dl "deel-local"


function fcd
    cd (fd . --type d $argv | fzf) && tmux new-session -s (pwd | sed "s/.*\///")
end

function tm
    command tmux new-session -s (pwd)
end

set -g DOCKER_BUILDKIT 1


# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

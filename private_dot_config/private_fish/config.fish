if status is-interactive
    # Commands to run in interactive sessions can go here
    alias vim nvim
    alias vi nvim

    # quick operation
    alias profile "nvim ~/.config/fish/config.fish"
    alias edit_term "nvim ~/.config/ghostty/config"
    alias sop "source ~/.config/fish/config.fish"
    alias oc opencode

    starship init fish | source
end

set -g fish_greeting

set -gx EDITOR nvim
# set -gx TERM xterm-256color
set -gx XDG_CONFIG_HOME ~/.config

set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

# go env
set -gx GOPROXY "https://goproxy.byted.org|direct"
set -gx GOPRIVATE *.byted.org,*.everphoto.cn,git.smartisan.com
set -gx GOSUMDB sum.golang.google.cn
# for go test generate
set -gx GOTESTS_TEMPLATE testify

# standard path
set PATH ~/bin /usr/local/bin /usr/local/sbin ~/.local/bin $PATH

# for rust
set RUSTUP_DIST_SERVER https://rsproxy.cn/
set RUSTUP_UPDATE_ROOT https://rsproxy.cn/rustup

# mole
set -gx MO_LAUNCHER_APP Ghostty

# goenv
# set -gx GOENV_PATH_ORDER front
set -gx GOENV_ROOT ~/.goenv
set PATH $GOENV_ROOT/bin $PATH
eval "$(goenv init -)"
# function init_goenv
#     set PATH $GOROOT/bin $GOPATH/bin $PATH
# end
# init_goenv

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Added by coco installer
fish_add_path /Users/bytedance/.local/bin

. ~/.bash_aliases
. /usr/share/fzf/shell/key-bindings.bash
set -o vi
shopt -s globstar
export EDITOR=nvim
export VISUAL=nvim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GO111MODULE=auto
export CGO_ENABLED=1


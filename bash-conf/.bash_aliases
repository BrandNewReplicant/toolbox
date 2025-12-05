alias l='ls -l'
alias la='ls -al'
alias vim='nvim'
alias v='nvim'
alias g='git'
alias c='clear'
alias h='cd $HOME'

function mcd {
        mkdir -p "$@" && cd "$_"
}

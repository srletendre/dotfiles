# DOTFILES_ROOT should be defined in here:
. ~/.local/bashrc_local_pre.sh
BASHRC_ROOT=$DOTFILES_ROOT/bash
################################################################################
case $- in
    *i*) ;;
      *) return;;
esac
################################################################################
. $BASHRC_ROOT/variables.sh
. $BASHRC_ROOT/prompt.sh
. $BASHRC_ROOT/python.sh
. $BASHRC_ROOT/emacs.sh
. $BASHRC_ROOT/git.sh
. $BASHRC_ROOT/docker.sh
. $BASHRC_ROOT/kubernetes.sh
. /etc/bash_completion
################################################################################
shopt -s globstar
shopt -s checkwinsize
################################################################################
ulimit -c unlimited
################################################################################
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias rp='realpath'
alias fzf='fzf --bind "enter:execute(echo {}),ctrl-e:execute-silent(code {})"'
alias ls='ls --color'
alias lx='exa -a --icons --long' # the --git flag is kind of nice, but sometimes takes too long
alias bat='/usr/bin/batcat'
alias ssdn='sudo shutdown now'
alias brc='$EDITOR $BASHRC_ROOT/bashrc.sh'
################################################################################
function sho () {
        if [ -d $1 ]; then
                exa $1
        else
                bat --paging=never $1
        fi
}
################################################################################
# speed dial
# gt go to
# e edit
# s sho
# c cat
# k kill
. ~/.local/bashrc_local_post.sh

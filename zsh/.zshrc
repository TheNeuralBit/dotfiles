# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/home/hulettbh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/antigen.zsh
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k
antigen bundle vi-mode
antigen apply

# purepower powerlevel10k config
source ~/.purepower

if [[ -r ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

export KEYTIMEOUT=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

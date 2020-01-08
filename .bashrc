
parse_git_branch() {        
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
 }
export PS1="\n\[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;6m\]\H\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput bold)\]\[\033[38;5;31m\]\w\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[\033[38;5;31m\]\[$(tput bold)\][\D{%r}]\[$(tput sgr0)\]\[\033[38;5;10m\]\$(parse_git_branch)\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"

alias k=kubectlalias 
s=screen
complete -F __start_kubectl k

#kubectx and kubensexport 
source <(kubectl completion bash)
source <(aks-engine completion)
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() {    
  if ! type __start_kubectl >/dev/null 2>&1; then        
    source <(command kubectl completion zsh)    
  fi    
  command kubectl "$@"
}

export PATH=~/.kubectx:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bashalias f=fzfexport FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

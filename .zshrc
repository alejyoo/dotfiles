setopt auto_cd
setopt correct
setopt interactive_comments
setopt share_history
setopt inc_append_history

alias ..="cd .."
alias ...="cd ../.."

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

command -v eza >/dev/null && {
  alias ls="eza --group-directories-first --icons"
  alias ll="eza -lah --group-directories-first --icons"
  alias la="eza -la --group-directories-first --icons"
  alias tree="eza -T --icons"
}

command -v bat >/dev/null && alias cat="bat --paging=never"

unalias g 2>/dev/null
unfunction g 2>/dev/null
g() { command git "$@"; }

alias gs="g s"
alias gl="g l"
alias gll="g ll"
alias gd="g d"
alias gds="g ds"

alias ga="g a"
alias gaa="g aa"

alias gc="g c"
alias gcm="g cm"
alias gca="g ca"
alias gcan="g can"

alias gb="g b"
alias gba="g ba"
alias gco="g co"
alias gcb="g cb"

alias gpl="g pl"
alias gplr="g plr"
alias gp="g p"
alias ggpush="g ggpush"
alias gpf="g pf"

alias gst="g st"
alias gstp="g stp"
alias gstl="g stl"

alias gcl="g cl"
alias grh="g rh"

mkcd() {
  mkdir -p "$1" && cd "$1"
}

bak() {
  local src="${1%/}"
  [[ -e "$src" ]] || return 1
  cp -a "$src" "$src.bak"
}

f() {
  local dir
  dir="$(fzf --type d)"
  [[ -n "$dir" ]] && cd "$dir"
}

eval "$(fnm env --use-on-cd)"

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob "!.git/*""
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"
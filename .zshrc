#キーバインド
bindkey -v

#ヒストリ
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# -z -> zsh-style load
autoload -Uz colors
colors
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
autoload bashcompinit
bashcompinit
source ~/.git-completion.bash

# cdいらず
setopt auto_cd
# ディレクトリスタック行き 
setopt auto_pushd
setopt correctall
setopt complete_aliases
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt list_packed
setopt prompt_subst
setopt pushd_ignore_dups
setopt rmstar_wait


zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%B%d%bにマッチするものが見つかりませんでした'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/rin
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select


#カレントディレクトリの表示
RPROMPT="%{$fg_bold[white]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$fg_bold[white]%}]%{$reset_color%}"

#rootとか

case ${UID} in
  0)
  PROMPT="%{$fg_bold[green]%}%m%{$fg_bold[red]%}#%{$reset_color%} "
  PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
  ;;
  *)
  PROMPT="%{$fg_bold[yellow]%}%m%{$fg_bold[white]%}%%%{$reset_color%} "
  PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
  ;;
esac

function chpwd(){ ls -v -F --color=auto}


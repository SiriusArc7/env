#----------------
# Basic
#----------------
setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correctall
setopt magic_equal_subst
setopt prompt_subst
setopt notify

#キーバインド
bindkey -v

autoload -Uz colors
colors
autoload -Uz promptinit
promptinit
autoload bashcompinit
bashcompinit
# https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh
source ~/.git-completion.zsh

#----------------
# ヒストリ
#----------------
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history

#----------------
# 補完
#----------------
autoload -Uz compinit; compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types

#----------------
# Glob 
#----------------
setopt extended_glob
unsetopt caseglob

# cdいらず
setopt auto_cd
# ディレクトリスタック行き 
setopt complete_aliases
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


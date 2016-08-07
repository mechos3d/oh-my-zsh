# Created by gorgolevsky 16-07-2016. Based on oh-my-zsh's 'vi-mode' plugin
# ATTENTION! This plugin overrides PROMPT if it's initialized in theme.

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

zle -N zle-keymap-select
zle -N edit-command-line

bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

local normal_mode="%{$fg_bold[red]%}▷▷▷ %{$reset_color%}"
local insert_mode="    "

# If mode_indicator is unset (mode was not changed while on this line - it is set to NORMAL_MODE)
function vi_mode_prompt_info() {
  local mode_indicator=$(echo "${${KEYMAP/vicmd/$normal_mode}/(main|viins)/$insert_mode}")
  if [ -z "$mode_indicator" ]
  	then local mode_indicator=$insert_mode
  fi
  echo $mode_indicator
}
# 30
PROMPT='%F{28}%~%{$reset_color%}
$(vi_mode_prompt_info)%{$reset_color%}%F{43}▷%{$reset_color%} '

# PROMPT='%F{43}%1~ %F{30}%~%{$reset_color%}
# $(vi_mode_prompt_info)%{$reset_color%}%F{43}▷%{$reset_color%} '

# Можно сделать многострочный правый RPROMT: (я бы перенес полный pwd туда)
# http://superuser.com/questions/974908/multiline-rprompt-in-zsh
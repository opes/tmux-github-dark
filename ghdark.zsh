#!/usr/bin/env bash

main() {
  local green='#238636'
  local dark_green='#2ea043'
  local white='#f0f6fc'
  local black='#0d1117'
  local comment_grey='#30363d'
  local menu_grey='#21262d'
  local special_grey='#484f58'

  tmux set-option -g mode-style 'bg=#161b22'

  tmux set-option -g status-justify centre
  tmux set-option -g status-style "bg=${comment_grey}"
  tmux set-option -g status-left ' #S '
  tmux set-option -g status-left-style "bg=${green},fg=${black}"

  local battery_section=''
  [[ "$OSTYPE" == darwin* ]] && battery_section=" | Batt:#{battery_percentage}"
  tmux set-option -g status-right " CPU:#{cpu_percentage}${battery_section} #[bg=${special_grey}] %m/%d %R "
  tmux set-option -g status-right-style "bg=${menu_grey},fg=${white}"

  tmux set-window-option -g window-status-format ' #I:#W '
  tmux set-window-option -g window-status-style "bg=${menu_grey}"
  tmux set-window-option -g window-status-current-format ' #I:#W '
  tmux set-window-option -g window-status-current-style "bg=${green},fg=${black}"
  tmux set-window-option -g window-status-separator ''
}

main

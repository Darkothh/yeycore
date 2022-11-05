#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# SCRIPTS_DIR="$CURRENT_DIR/scripts"
# source "$CURRENT_DIR/utils/tmux.sh"

get-tmux-option() {
  local option value default
  option="$1"
  default="$2"
  value="$(tmux show-option -gqv "$option")"

  if [ -n "$value" ]; then
    echo "$value"
  else
    echo "$default"
  fi
}
# PLAYER="$SCRIPTS_DIR/player/player.sh"

# set_bubble(){
#   local module script
#   module="$(get-tmux-option "@yeycore_module" "date")"
#   # module="date"
#   script="/home/core/.tmux/plugins/yeycore/modules/${module}.tmux"
#   echo "#[bg=$color_6,fg=$color_4]#[fg=$color_1]$($script)"
# }

main() {
  local theme
  theme="$(get-tmux-option "@yeycore_theme" "moon")"
  tmux run -b "$CURRENT_DIR/core_${theme}.tmuxtheme"
  # source "$CURRENT_DIR/core_${theme}.tmuxtheme"
  # tmux set-option -gq status-right $(set_bubble)
  # set_tmux_option status-right "#[fg=$color_3,bg=$color_1,nobold,nounderscore,noitalics]#[fg=$color_1,bg=$thm_blue,nobold,nounderscore,noitalics] #[fg=$color_2,bg=$color_6] #($PLAYER)"
}

main "$@"

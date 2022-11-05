#!/usr/bin/env bash
set_tmux_option() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

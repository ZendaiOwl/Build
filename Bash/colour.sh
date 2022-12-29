#!/usr/bin/env bash
# Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
#
# 	Text Colours
# 	Black		\e[0;30m || \033[0;30m
# 	Orange 		\e[0;31m || \033[0;31m
# 	Green		\e[0;32m || \033[0;32m
# 	Yellow		\e[0;33m || \033[0;33m
# 	Blue		\e[0;34m || \033[0;34m
# 	Red 		\e[0;35m || \033[0;35m
# 	Gray		\e[0;36m || \033[0;36m
# 	Light Gray	\e[0;37m || \033[0;37m
# 	White		\e[0;38m || \033[0;38m
# 	White		\e[0;39m || \033[0;39m
# 	
# 	Background Colours
# 	Black        \e[0;40m || \033[0;40m
# 	Red          \e[0;41m || \033[0;41m
# 	Green        \e[0;42m || \033[0;42m
# 	Yellow       \e[0;43m || \033[0;43m
# 	Blue         \e[0;44m || \033[0;44m
# 	Purple       \e[0;45m || \033[0;45m
# 	Cyan         \e[0;46m || \033[0;46m
# 	White        \e[0;47m || \033[0;47m
# 	
# 	Reset 		\e[0m || \033[0m
#
# 16-bit colours
# W='\e[0;37m'        # White
# C='\e[0;36m'        # Cyan
# P='\e[0;35m'        # Purple
# B='\e[0;34m'        # Blue
# Y='\e[0;33m'        # Yellow
# G='\e[0;32m'        # Green
# R='\e[0;31m'        # Red
# B='\e[0;30m'        # Black
# Z='\e[0m'           # Text Reset
# 
colour() {
  local -r Z='\e[0m' \
           PFX="COLOUR" \
           COLOUR=('\e[37m' '\e[36m' '\e[35m' '\e[34m' '\e[33m' '\e[32m' '\e[31m' '\e[30m' '\e[0m') \
           NAME=("WHITE" "CYAN" "PURPLE" "BLUE" "YELLOW" "GREEN" "RED" "BLACK" "RESET")
  for C in {0..8}
  do
    printf "${COLOUR[$C]}%s${Z} \t%s\n" "${NAME[$C]}" "${COLOUR[$C]}"
  done
  exit 0
}
colour

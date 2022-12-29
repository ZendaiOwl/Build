#!/usr/bin/env bash
# Victor-ray, S <12261439+ZendaiOwl@users.noreply.github.com>
# This function uses /dev/urandom to generate a password randomly.
# Default length is 36
#
# Ex. This one below uses the most commonly allowed password characters
# < /dev/urandom tr -dc 'A-Z-a-z-0-9' | head -c${1:-32};echo;
#
# 1: 'A-Z a-z 0-9'
# 2: 'A-Z a-z 0-9 {[#$@]}'
# 3: 'A-Z a-z 0-9 {[#$@*-+/]}'
# 4: 'A-Z a-z 0-9 <{[|?!~$#*-+/]}>'
# 5: 'A-Z a-z 0-9 {[|:?!#$@%+*^.~=,-]}'
# 6: A-Za-z0-9'{[|:?!#$@%+*^.~,=()/\\;]}'
# 7: 'A-Z a-z 0-9 {[|:?!#$@%+*^.~,-()/;]}'
# 8: 'A-Z a-z0-9{[|:?!#$@%+*^.~,=()/\\;]}'
# 9: 'A-Z a-z 0-9 {[|:?!#$@%+*^.~,-()/;/=]}'
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
< /dev/urandom tr -dc 'A-Z a-z0-9{[|:?!#$@%+*^.~,=()/\\;]}' | head -c"${1:-36}"; printf '\n' && exit 0

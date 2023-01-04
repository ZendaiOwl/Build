#!/usr/bin/env bash
set -euo pipefail
# This script records the output of a command to a text file
# @ZendaiOwl
# Colours
O=$(tput setaf 208)
G=$(tput setaf 48)
Z=$(tput sgr0)
debug() {
	local PFX
	PFX="${G}RECORD${Z}"
	printf '%s %-s\n' "${PFX}" "${@}"
}

error() {
	local PFX
	PFX="${O}${Z}"
	printf '%s %-s\n' "${PFX}" "${@}"
}

log_file="script_output.txt"

rec() { debug "Recording \"${1}\"to \"${log_file}\"";
		:>./"${log_file}";
		bash -c "${1}" | tee -a "${log_file}";
		debug "Done"; exit 0; }

rec_file() { debug "Recording \"${1}\" to \"${2}\"";
			:>./"${2}";
			bash -c "${1}" | tee -a "${2}";
			debug "Done"; exit 0; }

append() { debug "Appending \"${1}\" to \"${log_file}\"";
			bash -c "${1}" | tee -a "${log_file}";
			debug "Done"; exit; }

append_file() { debug "Appending \"${1}\" to \"${2}\"";
				bash -c "${1}" | tee -a "$2";
				debug "Done"; exit; }

usage() {
	debug "Usage: record.sh [script to record] \n record.sh [script to record] [name of output file]";
}

eXit() { debug "Cancelled, exiting"; exit 1; }
invalid() { error "Invalid choice: \"${1}\". Y/N expected"; exit 1; }

if [ "$#" -eq 0 ]
then
	error "No command arguments supplied"; usage; exit 1;
elif [ "$#" -eq 1 ]
then
	[[ -f "${log_file}" ]] && {
		read -rp "$(tput setaf 226)${log_file}$(tput sgr0) exist, append? (y/n)" input;
		if [ "${input}" == "y" ] || [ "${input}" == "Y" ]
		then
			append "${@}";
		elif [ "${input}" == "n" ] || [ "${input}" == "N" ]
		then
			eXit;
		else
			invalid "${input}";
		fi
		}
	if [ ! -f "${log_file}" ]
	then
		rec "${@}";
	fi
elif [ "$#" -eq 2 ]
then
	[[ -f "${2}" ]] && {
		read -rp "${2} $(tput setaf 226)exists$(tput sgr0), append? (y/n)" input;
		if [ "${input}" == "y" ] || [ "${input}" == "Y" ]
		then
			append_file "${@}";
		elif [ "${input}" == "n" ] || [ "${input}" == "N" ]
		then
			eXit;
		else
			invalid "${input}";
		fi
		}
	rec_file "${@}";
else
	error "Invalid number of arguments"; usage; exit 1
fi

exit 0

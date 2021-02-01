#!/bin/bash

# Command line completions for machinectl.
# This is _NOT_ an exhaustive completion setup.

_mctl_comps() {
	local MACHINE_CMD
	local IMAGE_CMD
	local ALL_CMD
	local MLIST

	COMPREPLY=()

	MACHINE_CMD=("status show start stop login shell enable disable poweroff reboot terminate kill copy-to copy-from bind")
	IMAGE_CMD=("image-status show-image clone rename read-only remove set-limit")
	ALL_CMD=("${IMAGE_CMD[@]}" "${MACHINE_CMD[@]}")
	MLIST="$(machinectl list-images --no-legend | awk '{print $1}')"

	if [[ "${COMP_CWORD}" -eq 1 ]]; then
		COMPREPLY=($(compgen -W "${ALL_CMD[*]}" "${COMP_WORDS[1]}")) 	

	elif [[ "${COMP_CWORD}" -eq 2 ]]; then
		COMPREPLY=($(compgen -W "${MLIST}" "${COMP_WORDS[2]}"))

	fi
}

complete -F _mctl_comps machinectl







# vim: set tabstop=4:shiftwidth=4:noexpandtabs

## Isowrt installer.
##    Copyright (C) 2023 lotigara
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.

#!/bin/bash

copy () {
	chmod +x isowrt.sh
	if [[ $1 == "system" ]] ; then
		sudo rm /usr/local/bin/isowrt && sudo cp isowrt.sh /usr/bin/local/isowrt
		echo 'Note that you need to add /usr/bin/local to your $PATH in your shell config file (e.g. .bashrc or .zshrc. Usually it already added, but you have to check it!'
	elif [[ $1 == "user" ]] ; then
		rm ~/.local/bin/isowrt && cp isowrt.sh ~/.local/bin/isowrt
		echo 'Note that you need to add $HOME/.local/bin to your $PATH in your shell config file (e.g. .bashrc or .zshrc. Usually it already added, but you have to check it!'
	else
		echo 'invalid installation type'
	fi
}

PS3='Installation type: '
types=("system" "user")

echo

select type in "${types[@]}" ; do
	if [[ -n $type ]] ; then
		echo "You selected: $type"
		break
	else
		echo 'Please select between user and system installation'
	fi
done

echo ''

copy $type

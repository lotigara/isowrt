## Isowrt. This script writes .iso image to your block devices, such as USB-flash or CD/DVD.
##    Copyright (C) 2023 lotigara
##    Copyright (C) 2023 rendick
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

red="\e[31m"
none="\e[0m"

bold=$(tput bold)
normal=$(tput sgr0)

shopt -s globstar extglob
PS3='File number: '

files=($(for i in ~/**/*.iso ; do echo "$i"; done | awk '{ print "\""$0"\""}' &> /dev/null))
IFS= mapfile -t files < <(find ~/ -type f -name "*.iso" -o -type d -name ".*.iso" | sort /dev/null)

echo ""
echo "Select a file:"
select file in "${files[@]}"; do
    if [[ -n $file ]]; then
        echo "You selected: $file"
        break
    else
        echo "Invalid option. Try again."
    fi
done

echo ""

sleep 0.5

lsblk -d | awk '/ 8:/'

function usb() {
    echo ""
    read -p "Enter your USB drive name: " usbdrive
    echo ""
    read -e -p "Your flash drive: /dev/${usbdrive}/ (y or n) " choice
}

usb

while [ "$choice" != "y" ]; do
    if [ "$choice" = "n" ]; then
        echo "you select no"
        sleep 1
        usb
    fi
done

echo "Wait..."

# Slow and not shows percentage
#  sudo dd if="${file}" of="/dev/${usbdrive}" bs=4M status=progress && sync
# pv < ${file} > ${usbdrive}

dd if=${file} | pv | doas dd of=${usbdrive}


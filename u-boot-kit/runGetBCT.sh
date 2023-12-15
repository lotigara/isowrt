#!/bin/bash

not_found_error='The tablet is not detected. Make sure that the device is in RCM mode and connected to the computer.'
timeout_error="It seems that you don't have the Python module \"usb\" installed. Install it by following the instructions of your distribution. If you have already done this, then try to turn off your tablet by holding the power button for about 5 seconds and switch it back to RCM mode."

device_not_found () {
	echo $not_found_error
	return 1
}

timeout_fail () {
	echo $timeout_error
    	return 2
}

fusee_gelee () {
	sudo ./fusee-launcher/fusee-launcher.py ./payload/disable_security_fuses.bin -P 7130
}

nvflash () {
	sudo ./utils/nvflash_v1.13.87205 --getbct --bct ./bct/surface_rt_bct.BIN --configfile ./utils/flash.cfg
	echo -e 'Now you need power off the tablet by holding power button about 5 secs. Then you need boot it in the RCM mode and run following command:\n./runUboot.sh'
}

main () {
	if lsusb | grep 'APX' ; then
        fusee_gelee
        if [ $? = 0 ] ; then
            nvflash
            if [ $? = 255 ] ; then
                exit 0
            fi

        else
            timeout_fail
        fi
    else
        device_not_found
    fi
}

main

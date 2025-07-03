#!/system/bin/sh
# // replace echo to ui_print
ui_print() {
  echo "$1"
}

# Kode Key
KEY="sukitovooe"

# // array & PATH
API=$(getprop ro.build.version.sdk )
NAME="Sensi | @rxysettings"
VERSION="Beta-Test | 1.0"
ANDROIDVERSION=$(getprop ro.build.version.release)
DATE="4 - 7 - 2025"
DEVICES=$(getprop ro.product.board)
MANUFACTURER=$(getprop ro.product.manufacturer)
ori=com.dts.freefireth
max=com.dts.freefiremax

# // The message that appears in the terminal
sleep 0.5
ui_print 
ui_print "
█▀ █▀▀ █▄░█ █▀ █
▄█ ██▄ █░▀█ ▄█ █"
ui_print
echo "   sensi free fire\n"
sleep 1
echo "***************************************"
sleep 0.2
echo "• Name            : ${NAME}"
sleep 0.2
echo "• Version         : ${VERSION}"
sleep 0.2
echo "• Android Version : ${ANDROIDVERSION}"
sleep 0.2
echo "• Build Date      : ${DATE}"
sleep 0.2
echo "***************************************"
sleep 0.2
echo "• Devices         : ${DEVICES}"
sleep 0.2
echo "• Manufacturer    : ${MANUFACTURER}"
sleep 0.2
echo "***************************************\n"
sleep 0.2

# // Check Android API
if [ $API -ge 30 ]; then
    echo "[ ! ] Currently"
else
    echo "[ ! ] Unsupported API Version: $API" && exit 1
fi

# // run component
seniz() {
wm size 1296x2880
}
open() {
seniz
if [ -n "$ori" ] && [ -n "$max" ]; then
		am start -n com.dts.freefireth/com.dts.freefireth.FFMainActivity> /dev/null 2>&1
	elif [ -n "$ori" ]; then
		am start -n com.dts.freefireth/com.dts.freefireth.FFMainActivity> /dev/null 2>&1
	elif [ -n "$max" ]; then
		am start -n com.dts.freefiremax/com.dts.freefireth.FFMainActivity> /dev/null 2>&1
	else
	    svc wifi enable
  		cmd connectivity airplane-mode disable
      svc data enable
		echo "Silahkan install Free Fire terlebih dahulu."
		exit 1
	fi
}
sleep 1
kito() {
settings put global touch.pressure.scale 0.001
settings put system touch.pressure.scale 0.001
settings put global windowsmgr.max_events_per_sec 180
settings put system windowsmgr.max_events_per_sec 180
settings put secure long_press_timeout 140
settings put secure multi_press_timeout 50
settings put system touch.scroll.calibration physical
settings put system touch.surface_flinger.calibration physical
settings put system touch.input_flinger.calibration physical
settings put system view.scroll_friction 10
settings put system pointer_speed 7
settings put global window_animation_scale 0.75
settings put global transition_animation_scale 0.75
settings put global animator_duration_scale 0.75
}

# // Clean Up 
# // Don't change the code below if you don't want all your data to be deleted
ui_print "[ - ] Setup Using Highest Sensi Free Fire"
find /sdcard/Android/data/*/cache/* -delete &>/dev/null
rm -rf /data/local/tmp/* > /dev/null 2>&1
sleep 3

# // The message that appears in the terminal
ui_print "[ - ] Finalizing Installation"
kito
sync # Sync to data in the rare case a device crashes

# // The message that appears in the terminal
sleep 2
ui_print "[ - ] All Done"
ui_print
sleep 4.5
open
#
# Credits
# topjohnwu / Magisk - Magisk Module Template
# JumbomanXDA, MrCarb0n / Script fixer and helper

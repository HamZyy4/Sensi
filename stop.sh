#!/system/bin/sh

echo
echo "[ ! ] Deleting Please Wait"
echo
sleep 2
uninstall () {
wm size reset
settings delete global touch.pressure.scale
settings delete system touch.pressure.scale
settings delete global windowsmgr.max_events_per_sec
settings delete system windowsmgr.max_events_per_sec
settings delete system touch.scroll.calibration
settings delete system touch.surface_flinger.calibration
settings delete system touch.input_flinger.calibration
settings delete system view.scroll_friction
settings delete system pointer_speed
settings put global window_animation_scale 1
settings put global transition_animation_scale 1
settings put global animator_duration_scale 1
}
uninstall > /dev/null 2>&1 &
echo "[ ! ] All Sensi & Tweaks Has Been Delete"
echo

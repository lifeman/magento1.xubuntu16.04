#!/bin/bash
sleep 53
#/usr/bin/notify-send "test test test test"
mpg123 /home/lifeman/short-notice.mp3 > /dev/null 2>&1
#beep
#beep
#beep
current_id=`xdotool getactivewindow`
hex_id=$(wmctrl -lp | grep Php  | awk '{print $1}' )
php_id=$(($hex_id))

if ! [ $current_id -eq $php_id ]
then
wmctrl -a PhpStorm 2016
sleep 1
r=$(( $RANDOM % 8 ))
echo "KeyStrPress Control_L Delay 1
`for ((a=1; a <= $r ; a++))
do 
echo "KeyStrPress Tab  KeyStrRelease Tab"   
done ` 
 Delay 1 KeyStrRelease Control_L" | xmacroplay ":0.0"  > /dev/null 2>&1
sleep 10
wmctrl -a $current_id -i
fi
exit 0
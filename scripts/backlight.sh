#!/bin/sh
#
# filename: backlight.sh
# description: control the backlight brightness of a Google CR-48
#
# usage: ./backlight.sh (up|down)
#
# uses 'cat' to write values to the video backlight device's 
# brightness file.
#

# location of the brightness device file
FILE=/sys/class/backlight/acpi_video0/brightness
# current value
CURRENT=`cat ${FILE}`

# command, whether up or down
COMMAND="$1"
# increment up/down by this amount
INCREMENT=1
# calculate a value to go up
UP_VAL=`echo "${CURRENT} + ${INCREMENT}" | bc`
# calculate a value to go down
DOWN_VAL=`echo "${CURRENT} - ${INCREMENT}" | bc`

# do not exceed 9, if increasing brightness
if [ ${UP_VAL} -gt 9 ]; then
  UP_VAL=9
fi

# do not exceed 0, if decreasing brightness
if [ ${DOWN_VAL} -lt 0 ]; then
  DOWN_VAL=0
fi

# set the value depending on the argument to this script, or show usage info
case ${COMMAND} in
up)
  echo ${UP_VAL} > ${FILE}
  ;;
down)
  echo ${DOWN_VAL} > ${FILE}
  ;;
*)
  echo "Usage: $0 (up|down)" 1>&2
  exit 1
esac

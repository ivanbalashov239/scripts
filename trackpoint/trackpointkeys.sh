#!/bin/bash
SCRIPTS="/home/ivn/scripts/trackpoint/"

normalmode='xmodmap -e "pointer = 1 12 3 4 5 6 7 8 9 10 11 2 13"'
ctrlmode='xmodmap -e "pointer = 11 12 13 4 5 6 7 8 9 10 1 2 3"'
browsermode='xmodmap -e "pointer = 1 2 3 4 5 6 7 8 9 10 11 12 13"'
checkfile="/tmp/trackpointkeys"


case "$1" in
  
    "normalmode" )
	    evrouter -q
	    xmodmap -e "pointer = 1 12 3 4 5 6 7 8 9 10 11 2 13"
	    mode="normalmode"
	    rm ${checkfile}
	    echo normalmode >> $checkfile
    ;;
     "ctrlmode" )
	     evrouter -q
	     rm /tmp/.evrouter:0
	     xmodmap -e "pointer = 11 12 13 4 5 6 7 8 9 10 1 2 3"
	     mode="ctrlmode"
	     rm ${checkfile}
	     echo ctrlmode >> $checkfile
	     evrouter --config=${SCRIPTS}evrouter-trackpoint.txt  ${SCRIPTS}trackpoint-event 
	     
    ;;
     "browsermode" )
	     evrouter -q
	     xmodmap -e "pointer = 1 2 3 4 5 6 7 8 9 10 11 12 13"
	     mode="browsermode"
	     rm ${checkfile}
	     echo browsermode >> $checkfile
    ;;
     "switch" )
	     oldmode=$(cat $checkfile)
	     if [ "$oldmode" != "normalmode" ]; then
		     mode="normalmode"
	     else
		     mode="ctrlmode"
	     fi
	     ${SCRIPTS}trackpointkeys.sh $mode
	     mode="switch"
	     exit
    ;;
esac


notify-send -i "${SCRIPTS}${mode}.png"  "TrackPoint Keys" "$mode"  

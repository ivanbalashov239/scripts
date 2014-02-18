#!/bin/bash
SCRIPTS=/home/ivn/scripts/

play /home/ivn/scripts/beep.wav
sleep 2
s=$(${SCRIPTS}get_time_text_ru.sh)
#echo $s

b=${s//+/}
b=$(echo "$b" | sed 's/  / /g')

notify-send -u low -t 10 -i "/home/ivn/Загрузки/KFaenzafordark/apps/48/time-admin2.png" -a Timenow "Часовщик" "$b"  
${SCRIPTS}saytext.sh "ru" "$s"
#!/bin/bash
SCRIPTS=/home/ivn/scripts/
lang=ru

notify-send -u low -t 10 -i "/home/ivn/Загрузки/KFaenzafordark/apps/48/gnome-sound-recorder.png" -a Timenow "Я слушаю" "Вас"  
text=$(${SCRIPTS}send_speech.sh $lang)


case "$text" in
"привет"  ) 
	    ${SCRIPTS}saytext.sh $lang "Д+обрый день"
;;
"громче"  ) 

;;
"тише"  ) 

;;
"музыка"  ) 

;;
"время"  ) 
	    ${SCRIPTS}say_time.sh
;;
"погода"  ) 
t="$(${SCRIPTS}get_wether_text_ru.sh)"
${SCRIPTS}saytext.sh $lang "$t"
;;
esac
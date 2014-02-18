#!/bin/bash
SCRIPTS=/home/ivn/scripts/

stime_H=$(date +%H)

stime_M=$(date +%M)

case "$stime_H" in
  
  "01" | "02" | "03" | "04" )
  DAYTIME=0
  ;;
"05" | "06" | "07" | "08" | "09" | "10" | "11" | "12"  )
  DAYTIME=1
  ;;
  "13" | "14" | "15" | "16" | "17" )
  DAYTIME=2
  ;;
  
  "18" | "19" | "20" | "21" | "22" | "23" | "24" | "0" | "00" )
  DAYTIME=3
  ;;
esac
let "stime_H= stime_H % 12"
if (( $stime_H == 0 )) ; then
    stime_H=12   
fi

if (( $stime_M >= 30 )) ; then
    let "stime_H= stime_H + 1"  
    
    if (( $stime_H == 13 )) ; then
	stime_H=1
	let "DAYTIME= (DAYTIME + 1) % 4"
    fi
    if (( $stime_H == 05 )) ; then
	let "DAYTIME= (DAYTIME + 1) % 4"
    fi
    if (( $stime_H == 18 )) ; then
	let "DAYTIME= (DAYTIME + 1) % 4"
    fi
fi



h="hours"

if (( $stime_M == 0 )) ; then
    
    if (($stime_H == 1)) ; then 
    h="hour" 
    fi
    TEXT="$(${SCRIPTS}number2text_en.sh ${stime_H} $h) "
elif (( ($stime_M > 0) && ($stime_M < 15) )) ; then
    TEXT="$(${SCRIPTS}number2text_en.sh ${stime_H} ) $(${SCRIPTS}number2text_en.sh ${stime_M} ) "

elif (( $stime_M == 15 )) ; then
    TEXT="quarter past $(${SCRIPTS}number2text_en.sh ${stime_H} ) "
elif (( ($stime_M > 15) && ($stime_M < 30) )) ; then
    TEXT="$(${SCRIPTS}number2text_en.sh ${stime_H} ) $(${SCRIPTS}number2text_en.sh ${stime_M} ) "
elif (( $stime_M == 30 )) ; then
    TEXT="half past $(${SCRIPTS}number2text_en.sh ${stime_H} ) "
elif (( ($stime_M > 30) && ($stime_M < 45) )) ; then
    TEXT="$(${SCRIPTS}number2text_en.sh ${stime_M} ) to $(${SCRIPTS}number2text_en.sh ${stime_H} ) "
elif (( $stime_M == 45 )) ; then
    TEXT="quarter to $(${SCRIPTS}number2text_en.sh ${stime_H} ) "
elif (( ($stime_M > 45) && ($stime_M <= 59) )) ; then
    TEXT="$(${SCRIPTS}number2text_en.sh ${stime_M} ) to $(${SCRIPTS}number2text_en.sh ${stime_H} ) "
fi


DT[0]="am"
DT[1]="am"
DT[2]="pm"
DT[3]="pm"

TEXT="$TEXT ${DT[$DAYTIME]}"

echo $TEXT
# b=${TEXT//+/}
# #b=$(echo "$b" | sed 's/ //g')
# b=${b//              / }
# b=${b//             / }
# b=${b//            / }
# b=${b//           / }
# b=${b//          / }
# b=${b//         / }
# b=${b//        / }
# b=${b//       / }
# b=${b//      / }
# b=${b//     / }
# b=${b//    / }
# b=${b//   / }
# b=${b//  / }
# b=${b//  / }
# b=${b//  / }
# b=${b//  / }
# b=${b//,/ }
# 
# notify-send -u low -t 10 -i "/home/ivn/Загрузки/KFaenzafordark/apps/48/time-admin2.png" -a Timenow "Часовщик" "$b"  
# 
# ${SCRIPTS}saytext_ru.sh "$TEXT"
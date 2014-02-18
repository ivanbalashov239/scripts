#!/bin/bash
SCRIPTS=/home/ivn/scripts/

stime_H=$(date +%H)

stime_M=$(date +%M)


case "$stime_H" in
  
   "24" | "0" | "00" | "01" | "02" | "03" | "04" )
  DAYTIME=0
  ;;
"05" | "06" | "07" | "08" | "09" | "10" | "11" | "12"  )
  DAYTIME=1
  ;;
  "13" | "14" | "15" | "16" | "17" )
  DAYTIME=2
  ;;
  
  "18" | "19" | "20" | "21" | "22" | "23" )
  DAYTIME=3
  ;;
esac
let "stime_H= stime_H % 12"
if (( $stime_H == 0 )) ; then
    stime_H=12   
fi
let "h=(stime_H + 1) % 12"
if (( $h == 0 )) ; then
    h=12   
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


DT[0]="н+очи"
DT[1]="утр+а"
DT[2]="дня"
DT[3]="в+ечера"

# $(${SCRIPTS}pluralform.sh ${stime_M} мин+ута мин+уты минут)
# $(${SCRIPTS}number2text_ru.sh male ${a})



if  (( (($stime_M == 0) | ($stime_M <= 3)) | ($stime_M >= 58) )) ; then
    a=${stime_H}
    if (($stime_H == 1)) ; then 
    a=""
    fi
    TEXT="$(${SCRIPTS}number2text_ru.sh male ${a}) $(${SCRIPTS}pluralform.sh ${stime_H} час час+а час+ов) "
    TEXT="$TEXT ${DT[$DAYTIME]}"
elif (( $stime_M == 45 )) ; then
    TEXT="без пятн+адцати $(${SCRIPTS}number2text_ru.sh male $h ) "
    if (($h == 1)) ; then 
    TEXT="без пятн+адцати час"
    fi
elif (( $stime_M == 30 )) ; then
    TEXT="половина $(${SCRIPTS}number2textcase_ru.sh $h ) "
elif (( ($stime_M > 3) && ($stime_M < 29) )) ; then
    TEXT="$(${SCRIPTS}number2text_ru.sh female ${stime_M}) $(${SCRIPTS}pluralform.sh ${stime_M} мин+ута мин+уты минут) $(${SCRIPTS}number2textcase_ru.sh $h ) "
elif (( ($stime_M > 31) && ($stime_M < 58) )) ; then
    let "m=(60 - stime_M)"
    TEXT="без $(${SCRIPTS}number2textpart_ru.sh ${m}) $(${SCRIPTS}pluralform.sh ${m} мин+уты мин+ут мин+ут) $(${SCRIPTS}number2text_ru.sh male $h ) "
fi

# if (( $stime_M == 0 )) ; then
# TEXT="$TEXT ${DT[$DAYTIME]}"
# fi

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
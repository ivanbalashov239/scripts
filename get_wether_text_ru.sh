# http://ru.festivalspeaker.wikia.com
SCRIPTS=/home/ivn/scripts/

stime_H=$(date +%H)
stime_M=$(date +%M)

year=`date +%Y`
dat=`date +%H` #Время (кол-во часов)
day=`date +%A` #День недели
mont=`date +%B` #Месяц
num=`date +%e` #Число месяца
minut=`date +%M` #минута
n=$num #Порядковый номер названия числа словами в массиве chislo
night=5 #Конец ночи
morning=11 #Конец утра
afternoon=18 #Конец дня
evening=24 #Конец вечера
chislo=(ЧислаСловами первое второе третье четвёртое пятое шестое седьмое восьмое девятое десятое одиннадцатое двенадцатое тринадцатое четырнадцатое пятнадцатое шестнадцатое семнадцатое восемнадцатое девятнадцатое двадцатое двадцатьпервоое двадцатьвтороое двадцатьтретье двадцатьчетвёртоое двадцатьпятоое двадцатьестоое двадцатьседьмоое двадцатьвосьмоое двадцатьдевятоое тридцатое тридцатьпервоое)

# if [ $dat -le $night ]
# then
# TEXT="Доброй н+очи.
# " 
# elif [ $dat -gt $night ] && [ $dat -le $morning ]
# then
# TEXT="Доброе утро.
# " 
# elif [ $dat -gt $morning ] && [ $dat -le $afternoon ]
# then
# TEXT="Добрый день.
# " 
# elif [ $dat -gt $afternoon ] && [ $dat -le $evening ]
# then
# TEXT="Добрый вечер.
# "
# fi
# #time=$(${SCRIPTS}time.sh)
# #day="$day, $(${SCRIPTS}date.sh)"
# #year=$(${SCRIPTS}caseform.sh $year)
# TEXT="${TEXT} $time
# Сегодня $day"
# #echo "Сегодня" $day, $mont "месяц", ${chislo[n]} "число." >> $TEXT
# 
# 
# 
# b=${TEXT//+/}
# b=${b//    / }
# b=${b//   / }
# b=${b//  / }






time=$(date +%H)

URL="http://informer.gismeteo.ru/xml/26063.xml"
EXEC="/usr/bin/curl -s"

a=`$EXEC $URL`

#вывести строки с 12 по 18
#sed -n 12,18p

PHENOMENA=`echo -ne $a | tr "/>" "\n" | grep PHENOMENA | sed -n 1p | sed -e 's/<PHENOMENA //' |\
sed -e 's/"//g' | tr -d "cloudiness=" | tr -d "precipitation=" | tr -d "rpower=" | tr -d "spower=" `

# echo  $PHENOMENA | `awk '{ print $1}'`
cloudiness=`echo ${PHENOMENA} | awk '{ print $1}'`
precipitation=`echo ${PHENOMENA} | awk '{ print $2}'`
rpower=`echo ${PHENOMENA} | awk '{ print $3}'`
spower=`echo ${PHENOMENA} | awk '{ print $4}'`
case "$cloudiness" in
  
  "0" )
  cloud="Ясно"
  ;;
  "1" )
  cloud="Малооблачно"
  ;;
  "2" )
  cloud="Облачно"
  ;;
  "3" )
  cloud="Пасмурно"
  ;;
esac

case "precipitation" in
  
  "0" )
  rain="Без осадков"
  ;;
  "10" )
  rain="Небольшой дождь"
  ;;
  "4" )
  rain="Дождь"
  ;;
  "3" )
  rain="Временами дождь"
  ;;
  "3" )
  rain="Сильный дождь"
  ;;
esac


#температура
temp=$(echo $a | tr "/>" "\n" | grep HEAT | sed -n 1p | sed -e 's/<HEAT //' |\
sed -e 's/"//g' | tr -d "min=" | tr -d "max=" | sed -e 's/ //' |\
gawk '{ print ($1+$2)/2}' )

#ветер
WIND_DIRECTION=`echo -e $a | tr "/>" "\n" | grep WIND | sed -n 1p | sed -e 's/<WIND //' |\
sed -e 's/"//g' | tr -d "direction=" | sed -e 's/ //' |\
gawk '{ print $3 }'`

WDN[0]="Северный"
WDN[1]="СевероВосточный"
WDN[2]="Восточный"
WDN[3]="ЮгоВосточный"
WDN[4]="Южный"
WDN[5]="ЮгоЗападный"
WDN[6]="Западный"
WDN[7]="СевероЗападный"

wind=`echo -ne $a | tr "/>" "\n" | grep WIND | sed -n 1p | sed -e 's/<WIND //' |\
sed -e 's/"//g' | tr -d "min=" | tr -d "max=" | sed -e 's/ //' |\
gawk '{ print ($1+$2)/2}'`


#давление
pressure=$(echo $a | tr "/>" "\n" | grep PRESSURE | sed -n 1p | sed -e 's/<PRESSURE //' |\
sed -e 's/"//g' | tr -d "min=" | tr -d "max=" | sed -e 's/ //' |\
gawk '{ print ($1+$2)/2}')


# notify-send -u low -t 10 -i "/home/ivn/Загрузки/KFaenzafordark/apps/48/time-admin2.png" -a Timenow "Приветствие" "$b"  
# 
# echo "$TEXT"



# echo $temp
if (( $temp < 0 )) ; then 
  temps="минус"
  let "temp= temp * (-1)" 
fi
TEXT="Температура за окном $temps $(${SCRIPTS}number2text_ru.sh male ${temp}) $(${SCRIPTS}pluralform.sh ${temp} градус градуса градусов) по ц+елсию,"
      
# echo $wind
if (( $wind < 0 )) ; then 
  winds="минус"
  let "wind= wind * (-1)" 
fi
TEXT="${TEXT} Ветер ${WDN[$WIND_DIRECTION]} $winds $(${SCRIPTS}number2text_ru.sh male ${wind}) $(${SCRIPTS}pluralform.sh ${wind} метр метра метров) в секунду,"   
# echo $pressure
if (( $pressure < 0 )) ; then 
  pressures="минус"
  let "pressure= pressure * (-1)" 
fi
TEXT="${TEXT} Давление $pressures $(${SCRIPTS}number2text_ru.sh mid ${pressure}) $(${SCRIPTS}pluralform.sh ${pressure} милиметр милиметра милиметров) ртутного столба."       
      
 
# b=${TEXT//+/}
# b=${b//    / }
# b=${b//   / }
# b=${b//    / }
# b=${b//   / }
# b=${b//  / }
# b=${b//  / }


# notify-send -u low -t 10 -i "/home/ivn/Загрузки/KFaenzafordark/apps/48/time-admin2.png" -a Timenow "Погода" "$b"  

echo "$TEXT"
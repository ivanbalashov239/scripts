SCRIPTS=/home/ivn/scripts/

case "$1" in
"male" ) 
    case "$2" in
      "0"  |  "00" ) text="" ;;
      "1"  |  "01" ) text="од+ин" ;;
      "2"  |  "02" ) text="дв+а" ;;
      "3"  |  "03" ) text="тр+и" ;;
      "4"  |  "04" ) text="чет+ыре" ;;
      "5"  |  "05" ) text="п+ять" ;;
      "6"  |  "06" ) text="ш+есть" ;;
      "7"  |  "07" ) text="с+емь" ;;
      "8"  |  "08" ) text="в+осемь" ;;
      "9"  |  "09" ) text="д+евять" ;;
      "10" ) text="д+есять" ;;
      "11" ) text="од+иннадцать" ;;
      "12" ) text="двен+адцать" ;;
      "13" ) text="трин+адцать" ;;
      "14" ) text="чет+ырнадцать" ;;
      "15" ) text="пятн+адцать" ;;
      "16" ) text="шестн+адцать" ;;
      "17" ) text="семн+адцать" ;;
      "18" ) text="восемн+адцать" ;;
      "19" ) text="девятн+адцать" ;;
    esac
;;
"female" ) 
    case "$2" in
      "0"  |  "00" ) text="" ;;
      "1"  |  "01" ) text="одн+а" ;;
      "2"  |  "02" ) text="две" ;;
      "3"  |  "03" ) text="тр+и" ;;
      "4"  |  "04" ) text="чет+ыре" ;;
      "5"  |  "05" ) text="п+ять" ;;
      "6"  |  "06" ) text="ш+есть" ;;
      "7"  |  "07" ) text="с+емь" ;;
      "8"  |  "08" ) text="в+осемь" ;;
      "9"  |  "09" ) text="д+евять" ;;
      "10" ) text="д+есять" ;;
      "11" ) text="од+иннадцать" ;;
      "12" ) text="двен+адцать" ;;
      "13" ) text="трин+адцать" ;;
      "14" ) text="чет+ырнадцать" ;;
      "15" ) text="пятн+адцать" ;;
      "16" ) text="шестн+адцать" ;;
      "17" ) text="семн+адцать" ;;
      "18" ) text="восемн+адцать" ;;
      "19" ) text="девятн+адцать" ;;
    esac
;;
"mid" ) 
    case "$2" in
      "0"  |  "00" ) text="" ;;
      "1"  |  "01" ) text="одн+о" ;;
      "2"  |  "02" ) text="дв+е" ;;
      "3"  |  "03" ) text="тр+и" ;;
      "4"  |  "04" ) text="чет+ыре" ;;
      "5"  |  "05" ) text="п+ять" ;;
      "6"  |  "06" ) text="ш+есть" ;;
      "7"  |  "07" ) text="с+емь" ;;
      "8"  |  "08" ) text="в+осемь" ;;
      "9"  |  "09" ) text="д+евять" ;;
      "10" ) text="д+есять" ;;
      "11" ) text="од+иннадцать" ;;
      "12" ) text="двен+адцать" ;;
      "13" ) text="трин+адцать" ;;
      "14" ) text="чет+ырнадцать" ;;
      "15" ) text="пятн+адцать" ;;
      "16" ) text="шестн+адцать" ;;
      "17" ) text="семн+адцать" ;;
      "18" ) text="восемн+адцать" ;;
      "19" ) text="девятн+адцать" ;;
    esac
;;
esac


if ((( $2 >= 20) && ( $2 < 30) )) ; then
    let "a=$2 % 10"
    text="дв+адцать $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 30) && ( $2 < 40) )) ; then
    let "a=$2 % 10"
    text="тр+идцать $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 40) && ( $2 < 50) )) ; then
    let "a=$2 % 10"
    text="с+орок $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 50) && ( $2 < 60) )) ; then
    let "a=$2 % 10"
    text="пятьдес+ят $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 60) && ( $2 < 70) )) ; then
    let "a=$2 % 10"
    text="шестьдес+ят $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 70) && ( $2 < 80) )) ; then
    let "a=$2 % 10"
    text="с+емьдесят $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 80) && ( $2 < 90) )) ; then
    let "a=$2 % 10"
    text="в+осемьдесят $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
if ((( $2 >= 90) && ( $2 < 100) )) ; then
    let "a=$2 % 10"
    text="девян+осто $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 100) && ( $2 < 200) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="$(${SCRIPTS}number2text_ru.sh ${b} ) сто $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 200) && ( $2 < 300) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="двести $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 300) && ( $2 < 400) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="триста $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 400) && ( $2 < 500) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="четыреста $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 500) && ( $2 < 600) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="пятьсот $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 600) && ( $2 < 700) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="шестьсот $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 700) && ( $2 < 800) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="семьсот $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 800) && ( $2 < 900) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="восемьсот $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 900) && ( $2 < 1000) )) ; then
    let "b=$2 / 100"
    let "a=$2 % 100"
    text="девятьсот $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 1000) && ( $2 < 1000000) )) ; then
    let "b=$2 / 1000"
    let "a=$2 % 1000"
    text="$(${SCRIPTS}number2text_ru.sh ${b} ) т+ысяча $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 1000000) && ( $2 < 1000000000) )) ; then
    let "b=$2 / 1000000"
    let "a=$2 % 1000000"
    text="$(${SCRIPTS}number2text_ru.sh ${b} ) милли+он $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi

if ((( $2 >= 1000000000) && ( $2 < 1000000000000) )) ; then
    let "b=$2 / 1000000000"
    let "a=$2 % 1000000000"
    text="$(${SCRIPTS}number2text_ru.sh ${b} ) миллиард $(${SCRIPTS}number2text_ru.sh $1 ${a} )"
fi
#echo $a
echo $text
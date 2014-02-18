SCRIPTS=/home/ivn/scripts/

 case "$1" in
  
    "0" | "00")
    echo ""
    ;;
    "1" | "01")
    echo "одной"
    ;;
    "2" | "02" )
    echo "дв+ух"
    ;;
    "3" | "03" )
    echo "тр+ёх"
    ;;
    "4" | "04" )
    echo "четыр+ёх"
    ;;
    "5" | "05" )
    echo "пят+и"
    ;;
    "6" | "06" )
    echo "шест+и"
    ;;
    "7" | "07" )
    echo "сем+и"
    ;;
    "8" | "08" )
    echo "восьм+и"
    ;;
    "9" | "09" )
    echo "девят+и"
    ;;
    "10" )
    echo "десят+и"
    ;;
      "11" ) text="од+иннадцати" ;;
      "12" ) text="двен+адцати" ;;
      "13" ) text="трин+адцати" ;;
      "14" ) text="чет+ырнадцати" ;;
      "15" ) text="пятн+адцати" ;;
      "16" ) text="шестн+адцати" ;;
      "17" ) text="семн+адцати" ;;
      "18" ) text="восемн+адцати" ;;
      "19" ) text="девятн+адцати" ;;
    
esac


    #a="$(${SCRIPTS}number2textpart_ru.sh male $1 )"
    
if ((( $1 >= 20) && ( $1 < 30) )) ; then
    let "a=$1 % 10"
    text="двадцат+и $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 30) && ( $1 < 40) )) ; then
    let "a=$1 % 10"
    text="тридцат+и $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 40) && ( $1 < 50) )) ; then
    let "a=$1 % 10"
    text="сорок+а $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 50) && ( $1 < 60) )) ; then
    let "a=$1 % 10"
    text="пят+идесяти $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 60) && ( $1 < 70) )) ; then
    let "a=$1 % 10"
    text="шест+идесяти $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 70) && ( $1 < 80) )) ; then
    let "a=$1 % 10"
    text="сем+идесяти $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 80) && ( $1 < 90) )) ; then
    let "a=$1 % 10"
    text="восьм+идесяти $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi
if ((( $1 >= 90) && ( $1 < 100) )) ; then
    let "a=$1 % 10"
    text="девян+осто $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi

if ((( $1 >= 100) && ( $1 < 1000) )) ; then
    let "b=$1 / 100"
    let "a=$1 % 100"
    text="$(${SCRIPTS}number2textpart_ru.sh ${b} ) сто $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi

if ((( $1 >= 1000) && ( $1 < 1000000) )) ; then
    let "b=$1 / 1000"
    let "a=$1 % 1000"
    text="$(${SCRIPTS}number2textpart_ru.sh ${b} ) т+ысяча $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi

if ((( $1 >= 1000000) && ( $1 < 1000000000) )) ; then
    let "b=$1 / 1000000"
    let "a=$1 % 1000000"
    text="$(${SCRIPTS}number2textpart_ru.sh ${b} ) милли+он $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi

if ((( $1 >= 1000000000) && ( $1 < 1000000000000) )) ; then
    let "b=$1 / 1000000000"
    let "a=$1 % 1000000000"
    text="$(${SCRIPTS}number2textpart_ru.sh ${b} ) миллиард $(${SCRIPTS}number2textpart_ru.sh ${a} )"
fi

    #text=${text//ь/и}
    
#echo $a
echo $text
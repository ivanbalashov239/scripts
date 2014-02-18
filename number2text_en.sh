SCRIPTS=/home/ivn/scripts/


case "$1" in
"1" ) text="one" ;;
"2" ) text="two" ;;
"3" ) text="three" ;;
"4" ) text="four" ;;
"5" ) text="five" ;;
"6" ) text="six" ;;
"7" ) text="seven" ;;
"8" ) text="eight" ;;
"9" ) text="nine" ;;
"10" ) text="ten" ;;
"11" ) text="eleven" ;;
"12" ) text="twelve" ;;
"13" ) text="thirteen" ;;
"14" ) text="fourteen" ;;
"15" ) text="fifteen" ;;
"16" ) text="sixteen" ;;
"17" ) text="seventeen" ;;
"18" ) text="eighteen" ;;
"19" ) text="nineteen" ;;
esac

if ((( $1  >= 20) && ( $1  < 30) )) ; then
    let "a= $1  % 10"
    text="twenty $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 30) && ( $1  < 40) )) ; then
    let "a= $1  % 10"
    text="thirty $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 40) && ( $1  < 50) )) ; then
    let "a= $1  % 10"
    text="forty $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 50) && ( $1  < 60) )) ; then
    let "a= $1  % 10"
    text="fifty $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 60) && ( $1  < 70) )) ; then
    let "a= $1  % 10"
    text="sixty $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 70) && ( $1  < 80) )) ; then
    let "a= $1  % 10"
    text="seventy $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 80) && ( $1  < 90) )) ; then
    let "a= $1  % 10"
    text="eighty $(${SCRIPTS}number2text_en.sh ${a} )"
fi
if ((( $1  >= 90) && ( $1  < 100) )) ; then
    let "a= $1  % 10"
    text="ninety $(${SCRIPTS}number2text_en.sh ${a} )"
fi

if ((( $1  >= 100) && ( $1  < 1000) )) ; then
    let "b= $1  / 100"
    let "a= $1  % 100"
    text="$(${SCRIPTS}number2text_en.sh ${b} ) hundred $(${SCRIPTS}number2text_en.sh ${a} )"
fi

if ((( $1  >= 1000) && ( $1  < 1000000) )) ; then
    let "b= $1  / 1000"
    let "a= $1  % 1000"
    text="$(${SCRIPTS}number2text_en.sh ${b} ) thousand $(${SCRIPTS}number2text_en.sh ${a} )"
fi

if ((( $1  >= 1000000) && ( $1  < 1000000000) )) ; then
    let "b= $1  / 1000000"
    let "a= $1  % 1000000"
    text="$(${SCRIPTS}number2text_en.sh ${b} ) million $(${SCRIPTS}number2text_en.sh ${a} )"
fi

if ((( $1  >= 1000000000) && ( $1  < 1000000000000) )) ; then
    let "b= $1  / 1000000000"
    let "a= $1  % 1000000000"
    text="$(${SCRIPTS}number2text_en.sh ${b} ) billion $(${SCRIPTS}number2text_en.sh ${a} )"
fi

echo $text
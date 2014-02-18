#!/bin/bash

# This should change based on language.
# lang=es or something.
# Multiple results
#URL="http://www.google.com/speech-api/v1/recognize?lang=en&client=chromium&maxresults=6"
#echo "Начинается запись..."
arecord -d 3 -q -f cd -r 16000 speech.wav # Записываем звуковой файл speech.wav длиной в 3 секунды с рейтом 16 мГц
#echo "Запись закончена"
sox speech.wav speech.flac gain -n -5 silence 1 5 2% # Конвертируем speech.wav в speech.flac
rm speech.wav # Удаляем speech.wav, т.к. он нам уже не требуется
#echo "Анализ голоса..."

case "$1" in
"en"  ) LANGUAGE="en-US"
;;
"ru"  ) LANGUAGE="ru-RU"
;;
esac

URL="https://www.google.com/speech-api/v1/recognize?lang=$LANGUAGE&client=chromium"

#if [ -z "$1" ];then
#echo ""
#    exit 1
#fi
echo "$URL"
wget -qO- --post-file speech.flac --header 'Content-type: audio/x-flac; rate=16000' "$URL" > result.json

RESULT="$(cat result.json | sed 's/^[^[]*\[{\"utterance\":\"\([^\"]*\)\".*/\1/')"

echo "$RESULT"
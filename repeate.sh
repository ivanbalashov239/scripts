#!/bin/bash
SCRIPTS=/home/ivn/scripts/
lang=ru
text=$(${SCRIPTS}send_speech.sh $lang)
${SCRIPTS}saytext.sh $lang $text
echo $text
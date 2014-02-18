#!/bin/bash
SCRIPTS=/home/ivn/scripts/

case "$1" in
"en"  ) echo "$2" | festival --tts --language britishenglish # russian
;;
"ru"  ) echo "$2" | RHVoice | play -q -
;;
esac

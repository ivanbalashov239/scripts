#!/bin/bash
# 
# function myrecls {
#  ls -FdR  $1* | grep "/$" |  cat | while read line; do 
#    echo "
#    $line
#     "
#     myrecls $line
#  done#
#   
#  reg=$1"*"$2
#  ls  $1 | grep "$2$"  |  cat | while read line; do 
#    echo "
#    $line
#    "
#    name="$to${line##*/}"
#    echo $name
#    ln -s $line $name
#  done
# }
# 
# 
# SCRIPTS=/home/ivn/scripts/
# from=/home/ivn/Загрузки/
# to=/home/ivn/Видео/
# ext[0]=".avi"
# ext[1]=".mkv"
# ext[2]=".srt"
# ext[3]=".wmv"
# ext[4]=".jar"
# for ((i=0; i<${#ext[*]}; i++)); do 
#  reg=$from"*"${ext[$i]}
#  myrecls $from ${ext[$i]}
# done
# 
# #ls ~/scripts/*.sh | cat  | while read LINE; do echo $LINE; done

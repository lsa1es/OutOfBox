#!/bin/sh
moeda="$1"
curl "http://exame.advfn.com/p.php?pid=exame_monitor" > cotacao.html
lic=`cat -n cotacao.html | grep $moeda | awk '{print $1}'`
lic_tmp=`expr $lic + 1`
cot=`cat -n cotacao.html | grep "$lic_tmp" | head -n1 |awk -F\> '{print $2}' | sed 's/<\/td//g' | sed 's/,/./g' | sed 's/<\/script//g'` 
echo $cot

# EURO
#EURBRL - USDBRL


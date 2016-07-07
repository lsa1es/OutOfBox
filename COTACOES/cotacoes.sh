#!/bin/sh
#
# Script para buscar dados da Cotacao das moedas DOLAR EURO etc
# v0.1 - Luiz Sales
# www.redhate.me - www.lsales.biz
#
# GPL 2 - Se for usar o codigo ou copiar em outra linguagem, favor mencioar o autor e o site.
#


moeda="$1"
curl "http://exame.advfn.com/p.php?pid=exame_monitor" > cotacao.html
lic=`cat -n cotacao.html | grep $moeda | awk '{print $1}'`
lic_tmp=`expr $lic + 1`
cot=`cat -n cotacao.html | grep "$lic_tmp" | grep "," | head -n1 |awk -F\> '{print $2}' | sed 's/<\/td//g' | sed 's/,/./g' | sed 's/<\/script//g'`
/usr/local/zabbix/bin/zabbix_sender  -z 127.0.0.1 -s $moeda -k ct.cambio -o $cot



#!/bin/sh
#
# Script para buscar dados do MapLink com relação ao transito total.
# v0.1 - Luiz Sales
# www.redhate.me - www.lsales.biz
#
# GPL 2 - Se for usar o codigo ou copiar em outra linguagem, favor mencioar o autor e o site.
#

#VARIAVEIS
ZABBIX_SERVER="127.0.0.1"

URL="http://maplink.com.br/CE/fortaleza/TransitoAgora"
URLF="ceagora.html"

lynx -source $URL > $URLF
total_transito=$(cat $URLF | grep "totalSlow" | awk -F\> '{print $3}' | sed 's/<\/b//g')
while [ -z "$total_transito" ]; do
        cont_ts=`cat $URLF | grep "totalSlow" | wc -l`
        if [ "$cont_ts" -le "1" ]; then
                lynx -source $URL > $URLF
                total_transito=$(cat $URLF | grep "quilometroTransito" | awk -F\> '{print $2}' | sed 's/km<\/strong//g')
                else
                lynx -source $URL > $URLF
                total_transito=$(cat $URLF | grep "totalSlow" | awk -F\> '{print $3}' | sed 's/<\/b//g')
        fi
done

/usr/local/zabbix/bin/zabbix_sender  -z $ZABBIX_SERVER -s Maplink_SP -k tr.total -o $total_transito



#!/bin/sh
#
# Script para tratar dados da API do YOU TUBE
# v0.1 - Luiz Sales
# www.redhate.me - www.lsales.biz
#
# GPL 2 - Se for usar o codigo ou copiar em outra linguagem, favor mencioar o autor e o site.
#

#VARIAVEIS
# VID = id dos video
# API_KEY = Token para usar a API 
# ZABBIX_SERVER = ip do zabbix server

ZABBIX_SERVER="127.0.0.1"

VID="
djjhdanPl5g
4ExwNEWXz38"

API_KEY=""

for vids in `echo $VID`
do

curl "https://www.googleapis.com/youtube/v3/videos?id=$vids&part=statistics&key=$API_KEY" > VID.json

views=`cat VID.json  | grep "viewCount" | awk -F\: '{print $2}' | sed 's/"//g' | sed 's/,//g'`
likes=`cat VID.json  | grep "likeCount" | grep -v dis | awk -F\: '{print $2}' | sed 's/"//g' | sed 's/,//g'`
dlikes=`cat VID.json  | grep "dislikeCount" | awk -F\: '{print $2}' | sed 's/"//g' | sed 's/,//g'`
fav=`cat VID.json  | grep "favoriteCount" | awk -F\: '{print $2}' | sed 's/"//g' | sed 's/,//g'`
comments=`cat VID.json  | grep "commentCount" | awk -F\: '{print $2}' | sed 's/"//g'`


/usr/local/zabbix/bin/zabbix_sender  -z $ZABBIX_SERVER -s $vids -k yt.views -o $views
/usr/local/zabbix/bin/zabbix_sender  -z $ZABBIX_SERVER -s $vids -k yt.likes -o $likes
/usr/local/zabbix/bin/zabbix_sender  -z $ZABBIX_SERVER -s $vids -k yt.dlikes -o $dlikes
/usr/local/zabbix/bin/zabbix_sender  -z $ZABBIX_SERVER -s $vids -k yt.fav -o $fav
/usr/local/zabbix/bin/zabbix_sender  -z $ZABBIX_SERVER -s $vids -k yt.com -o $comments

done


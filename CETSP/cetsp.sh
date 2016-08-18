#!/bin/sh
#
# Script para buscar dados de transito do site da CET SP
# v0.1 - Luiz Sales
# www.redhate.me - www.lsales.biz
#
# GPL 2 - Se for usar o codigo ou copiar em outra linguagem, favor mencioar o autor e o site.
#

#VARIAVEIS
ZABBIX_SERVER="127.0.0.1"
ZABBIX_SENDER=""

norte_km() {

        lynx -source www.cetsp.com.br > cetsp.html
        linhai=$(cat -n cetsp.html | grep "<div class=\"info norte\">" | awk '{print $1}')
        linhaf=$(expr $linhai + 3)
        cat -n cetsp.html | grep $linhaf | grep km | awk '{print $2}' | awk -F\> '{print $2}'
}
sul_km() {

        lynx -source www.cetsp.com.br > cetsp.html
        linhai=$(cat -n cetsp.html | grep "<div class=\"info sul\">" | awk '{print $1}')
        linhaf=$(expr $linhai + 3)
        cat -n cetsp.html | grep $linhaf | grep km | awk '{print $2}' | awk -F\> '{print $2}'
}
leste_km() {

        lynx -source www.cetsp.com.br > cetsp.html
        linhai=$(cat -n cetsp.html | grep "<div class=\"info leste\">" | awk '{print $1}')
        linhaf=$(expr $linhai + 3)
        cat -n cetsp.html | grep $linhaf | grep km | awk '{print $2}' | awk -F\> '{print $2}'
}
oeste_km() {

        lynx -source www.cetsp.com.br > cetsp.html
        linhai=$(cat -n cetsp.html | grep "<div class=\"info oeste\">" | awk '{print $1}')
        linhaf=$(expr $linhai + 3)
        cat -n cetsp.html | grep $linhaf | grep km | awk '{print $2}' | awk -F\> '{print $2}'
}
centro_km() {

        lynx -source www.cetsp.com.br > cetsp.html
        linhai=$(cat -n cetsp.html | grep "<div class=\"info centro\">" | awk '{print $1}')
        linhaf=$(expr $linhai + 3)
        cat -n cetsp.html | grep $linhaf | grep km | awk '{print $2}' | awk -F\> '{print $2}'
}
help() {
        echo "Script para coletar os dados de transito da CET-SP"
        echo
        echo "Opcoes: $0 norte | sul | centro | leste | oeste"
        echo
        echo
}

case $1 in
        norte) $ZABBIX_SENDER -z $ZABBIX_SERVER -s CETSP -k cetsp.norte -o $(norte_km)
        ;;
        sul) $ZABBIX_SENDER -z $ZABBIX_SERVER -s CETSP -k cetsp.sul -o $(sul_km)
        ;;
        centro)  $ZABBIX_SENDER -z $ZABBIX_SERVER -s CETSP -k cetsp.centro -o $(centro_km)
        ;;
        leste)  $ZABBIX_SENDER -z $ZABBIX_SERVER -s CETSP -k cetsp.leste -o $(leste_km)
        ;;
        oeste)  $ZABBIX_SENDER -z $ZABBIX_SERVER -s CETSP -k cetsp.oeste -o $(oeste_km)
        ;;
        *) help
        ;;
esac


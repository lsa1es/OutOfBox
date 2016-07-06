#!/bin/sh

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
	norte) norte_km
	;;
	sul) sul_km
	;;
	centro) centro_km
	;;
	leste) leste_km
	;;
	oeste) oeste_km
	;;
	*) help
	;;
esac



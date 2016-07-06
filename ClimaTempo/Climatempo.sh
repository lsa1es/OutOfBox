#!/bin/sh

#ddmmyyyy=$(date "+%d/%m/%Y")

#ddmmyyyy="2/06/2016"
ddmmyyyy=$(date +%d/%m/%Y)


var() {
        temperatura=`cat $1.html | grep $ddmmyyyy | awk -Fmomento-temperatura '{print $2}' | awk -F\> '{print $2}' | sed 's/deg;<\/p/ /g' | sed 's/\&/ /g'`
        sensacao=`cat $1.html | grep $ddmmyyyy | awk -Fmomento-sensacao '{print $2}' | awk -F\> '{print $2}' | sed 's/deg;<\/li/ /g' | sed 's/\&/ /g'`
        humidade=`cat $1.html | grep $ddmmyyyy | awk -Fmomento-humidade '{print $2}' | awk -F\> '{print $2}' | sed 's/<\/li/ /g' | sed 's/\%//g'`
        pressao=`cat $1.html | grep $ddmmyyyy | awk -Fmomento-pressao '{print $2}' | awk -F\> '{print $2}' | sed 's/<\/li/ /g' | sed 's/\hPa//g'`
        vento=`cat $1.html | grep $ddmmyyyy | awk -Fmomento-vento '{print $2}' | awk -F\> '{print $2}' | sed 's/<\/li/ /g'`
	TempMin=`cat $1.html | grep "nima\">" | awk -Fdeg '{print $2}' | awk -Fnima\"\> '{print $2}' | sed 's/\&/ /g'`
	TempMax=`cat $1.html | grep "nima\">" | awk -Fdeg '{print $1}' | awk -Fxima\"\> '{print $2}' | sed 's/\&/ /g'`
	rm $1.html

}
sp() {
	lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/558/saopaulo-sp > sp.html
	var sp

        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.temp -o $(temperatura)
        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.sens -o $(sensacao)
        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.umid -o $(humidade)
        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.pres -o $(pressao)
        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.vent -o $(vento)
        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.tmin -o $(TempMin)
        /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s Sao_Paulo -k ct.tmax -o $(TempMax)
}

#	/usr/local/zabbix/bin/zabbix_sender 
}
ce() {
	lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/60/fortaleza-ce > ce.html
	var ce
}
ro() {
	lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/343/portovelho-ro > ro.html
	var ro
}
rr() {
	lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/347/boavista-rr > rr.html
	var rr
}

case $1 in
	ce)	ce
	;;
	ro)	ro
	;;
	sp)	sp
	;;
	rr)	rr
	;;
	*) echo "ro - sp"
	;;
esac



echo "Temperatura: $temperatura C"
echo "Sensacao: $sensacao C"
echo "Umidade: $humidade %"
echo "Pressao: $pressao hPa"
echo "Vento: $vento km/h"
echo "Temperatura Max: $TempMax"
echo "Temperatura Min: $TempMin"
echo




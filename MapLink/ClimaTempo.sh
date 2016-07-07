#!/bin/sh
#
# Script para buscar dados do ClimaTempo 
# v0.1 - Luiz Sales
# www.redhate.me - www.lsales.biz
#
# GPL 2 - Se for usar o codigo ou copiar em outra linguagem, favor mencioar o autor e o site.
#

#VARIAVEIS
ZABBIX_SERVER="127.0.0.1"

var() {
        echo $1
        temperatura=`cat $1.html | awk -Fmomento-temperatura '{print $2}' | awk -F\> '{print $2}' | awk 'NF>0' | sed 's/deg;<\/p/ /g' | sed 's/\&/ /g'`
        sensacao=`cat $1.html | awk -Fmomento-sensacao '{print $2}' | awk -F\> '{print $2}' | awk 'NF>0' | sed 's/deg;<\/li/ /g' | sed 's/\&/ /g'`
        humidade=`cat $1.html | awk -Fmomento-humidade '{print $2}' | awk -F\> '{print $2}' | awk 'NF>0' | sed 's/<\/li/ /g' | sed 's/\%//g'`
        pressao=`cat $1.html | awk -Fmomento-pressao '{print $2}' | awk -F\> '{print $2}' | awk 'NF>0' | sed 's/<\/li/ /g' | sed 's/\hPa//g'`
        pres=`echo -n $pressao ; echo ".0"`
        vento=`cat $1.html | awk -Fmomento-vento '{print $2}' | awk -F\> '{print $2}' | awk 'NF>0' | sed 's/<\/li/ /g'`
        TempMin=`cat $1.html | grep "nima\">" | awk -Fdeg '{print $2}' | awk -Fnima\"\> '{print $2}' | awk 'NF>0' | sed 's/\&/ /g'`
        TempMax=`cat $1.html | grep "nima\">" | awk -Fdeg '{print $1}' | awk -Fxima\"\> '{print $2}' | awk 'NF>0' | sed 's/\&/ /g'`
        rm $1.html
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.temp -o $temperatura
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.sens -o $sensacao
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.umid -o $humidade
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.pres -o $pressao
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.vent -o $vento
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.tmin -o $TempMin
        /usr/local/zabbix/bin/zabbix_sender -z $ZABBIX_SERVER -s $1 -k ct.tmax -o $TempMax
        #sleep 2s
        echo

}
AC() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/6/riobranco-ac > AC.html
        var AC
}
AL() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/8/maceio-al > AL.html
        var AL
}
AP() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/39/macapa-ap > AP.html
        var AP
}
AM() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/25/manaus-am > AM.html
        var AM
}
BA() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/56/salvador-ba > BA.html
        var BA
}
CE() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/60/fortaleza-ce > CE.html
        var CE
}
DF() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/61/brasilia-df > DF.html
        var DF
}
ES() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/84/vitoria-es > ES.html
        var ES
}
GO() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/88/goiania-go > GO.html
        var GO
}
MA() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/94/saoluis-ma > MA.html
        var MA
}
MT() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/218/cuiaba-mt > MT.html
        var MT
}
MS() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/212/campogrande-ms > MS.html
        var MS
}
MG() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/107/belohorizonte-mg > MG.html
        var MG
}
PA() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/232/belem-pa > PA.html
        var PA
}
PB() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/256/joaopessoa-pb > PB.html
        var PB
}
PR() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/271/curitiba-pr > PR.html
        var PR
}
PE() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/259/recife-pe > PE.html
        var PE
}
PI() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/264/teresina-pi > PI.html
        var PI
}
RJ() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/321/riodejaneiro-rj > RJ.html
        var RJ
}
RN() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/334/natal-rn > RN.html
        var RN
}
RS() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/363/portoalegre-rs > RS.html
        var RS
}

RO() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/343/portovelho-ro > RO.html
        var RO
}
RR() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/347/boavista-rr > RR.html
        var RR
}
SC() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/377/florianopolis-sc > SC.html
        var SC
}
SP() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/558/saopaulo-sp > SP.html
        var SP
}
SE() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/384/aracaju-se > SE.html
        var SE
}
TO() {
        lynx -source http://www.climatempo.com.br/previsao-do-tempo/cidade/593/palmas-to > TO.html
        var TO
}


case $1 in
        BA)     BA
        ;;
        RO)     RO
        ;;
        SP)     SP
        ;;
        RR)     RR
        ;;
        br)     AC; AL; AP; AM; BA; CE; DF; ES; GO; MA; MS; MT; MG; PA; PB; PR; PE; PI; RJ; RN; RS; RO; RR; SC; SP; SE; TO;
        ;;
        *) echo "Siglas do Estado em Maisculo"
        ;;
esac



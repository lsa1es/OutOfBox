#!/bin/sh
echo "{"
echo -e "\t\"data\":["
#echo -e "\t\t{" 
                

for x in `seq 1 1 17`
do
	lynx -source "http://exame.abril.com.br/mercados/cotacoes-bovespa/acoes?fullsite=true&page=$x" > PAGE-$x-ACOES.html
done
for i in `ls PAGE-*-ACOES.html`
do
#	echo $i
#	echo
	for a in `cat -n $i | grep "/mercados/cotacoes-bovespa/acoes/" | grep -v grafico | grep -v exame | awk '{print $1}'`
	do
		Acao=`cat -n $i | grep -E $a  | grep '/mercados/cotacoes-bovespa/acoes/' | sed 's/"//g' | sed 's/\// /g' | awk '{print $7}'`
		LinhaDesc=`expr $a + 2`
		Descr=`cat -n $i | grep -E $LinhaDesc | grep active-name | awk -F\> '{print $2}' | sed 's/<\/span//g'`
		LinhaValor=`expr $LinhaDesc + 2`
		Valor=`cat -n $i | grep -E $LinhaValor | grep -v grafico | grep center | awk -F\> '{print $2}' | sed 's/<\/td//g'`
                LinhaVariacao=`expr $LinhaValor + 1`
                Variacao=`cat -n $i | grep -E $LinhaVariacao | grep -v grafico | grep center | awk -F\> '{print $2}' | sed 's/<\/td//g'`

		echo -e "\t\t{"
		echo -e "\t\t\t\"{#BVACAO}\":\"$Acao\","
#		echo -e "\t\t\t\"{#BVDESC}\":\"$Descr\","
		echo -e "\t\t\t\"{#BVVALOR}\":\"$Valor\""
#		echo -e "\t\t\t\"{#BVVARIACAO}\":\"$Variacao\""
		echo -e "\t\t},"
	
#		echo -e 
#		echo -e "\t\t\tACAO: $Acao"
#		echo -e "\t\t\tDescricao: $Descr"
#		echo -e "\t\t\tValor: $Valor"
#		echo -e "\t\t\tVariacao: $Variacao"
#		echo
#		sleep 5s
	done
	
done
echo -e "\t]"
echo -e "}"
rm -rf PAGE-*-ACOES.html

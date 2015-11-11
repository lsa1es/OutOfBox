#!/bin/sh
menu() {
	echo "******************************************************"
	echo "**                 Script SABESP                    **"
	echo "**   Buscar percentagem do volume dos reservatorios **"
	echo "**   Buscar informações por meio do site da SABESP  **"
	echo "**                                                  **"
	echo "**   Criado por por Luiz Sales - lsales@lsales.biz  **"
	echo "**                        22/10/2014                **"	                        
	echo 
	echo
	echo "** 1) Cantareira                 2) Alto Tiete      **"
	echo "** 3) Guarapiranga               4) Alto Cotia      **"
	echo "** 5) Rio Grande                 6) Rio Claro       **"
	echo
	echo
}

case $1 in 
	6) vol=`lynx -source http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx | grep "volume armazenado" | awk -F ">" '{print $4}'  | sed 's/%<\/td//g' | sed 's/,/./g' | tail -n 1`
           /usr/local/zabbix/bin/zabbix_sender  -z 127.0.0.1 -s SABESP -k sabesp.6 -o $vol
	;;
	5) vol=`lynx -source http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx | grep "volume armazenado" | awk -F ">" '{print $4}'  | sed 's/%<\/td//g' | sed 's/,/./g' | tail -n 2 | head -n 1`
           /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s SABESP -k sabesp.5 -o $vol
	;;
	4) vol=`lynx -source http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx | grep "volume armazenado" | awk -F ">" '{print $4}'  | sed 's/%<\/td//g' | sed 's/,/./g' | tail -n 3 | head -n 1`
           /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s SABESP -k sabesp.4 -o $vol
	;;
	3) vol=`lynx -source http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx | grep "volume armazenado" | awk -F ">" '{print $4}'  | sed 's/%<\/td//g' | sed 's/,/./g' | tail -n 4 | head -n 1`
           /usr/local/zabbix/bin/zabbix_sender  -z 127.0.0.1 -s SABESP -k sabesp.3 -o $vol
	;;
	2) vol=`lynx -source http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx | grep "volume armazenado" | awk -F ">" '{print $4}'  | sed 's/%<\/td//g' | sed 's/,/./g' | tail -n 5 | head -n 1`
          /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s SABESP -k sabesp.2 -o $vol
	;;
	1) vol=`lynx -source http://www2.sabesp.com.br/mananciais/DivulgacaoSiteSabesp.aspx | grep "volume armazenado" | awk -F ">" '{print $4}'  | sed 's/%<\/td//g' | sed 's/,/./g' | tail -n 6 | head -n 1`
	   /usr/local/zabbix/bin/zabbix_sender -z 127.0.0.1 -s SABESP -k sabesp.1 -o $vol
	;;
	*) menu;
	 ;;	
esac

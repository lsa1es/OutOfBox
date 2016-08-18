Coletando as informações de lentidão do transito conforme o site da CET SP


Instale o lynx

Import o Template_CETSP.xml,

Crie um Host com o nome de CETSP, atribua o Template_CETSP a ele.

Faça download do script cetsp.sh

Altere as variaveis dentro dele:

ZABBIX_SERVER - IP DO ZABBIX
ZABBIX_SENDER - caminho do binario

Coloque na crontab para coletar os dados e enviar para o Zabbix de 5 em 5 minutos.

	*/5 * * * * /tmp/zabbix/cetsp.sh norte
	*/5 * * * * /tmp/zabbix/cetsp.sh sul
	*/5 * * * * /tmp/zabbix/cetsp.sh leste
	*/5 * * * * /tmp/zabbix/cetsp.sh oeste
	*/5 * * * * /tmp/zabbix/cetsp.sh centro
	

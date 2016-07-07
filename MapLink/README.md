Template para Zabbix para coleta de transito total de cada cidade mapeada pelo MapLink

Importe o Template_MapLink.xml

Crie um Host seguindo a seguinte estrutura

Host Name: Maplink_SP

Atribua o template ao Host criado.

Faça download do arquivo maplink_sp.sh

Altere as variaveis dele

	URL= ( Endereço que da acesso total aos atributos )
	URLF= ( nome o output do $URL )
	
Ponha na crontab:

	*/5 * * * * /tmp/zabbix/maplink_sp.sh  >/dev/null


OBS.: Eu fiz apenas para SP RJ e CE, mas se voce quiser monitorar alguma cidade basta seguir a mesma linha de raciocinio.



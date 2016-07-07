Template para Zabbix para coleta valores das moedas do cambio

Importe o Template_Cotacoes.xml

Crie um Host seguindo a seguinte estrutura

Host Name: USDBRL
Visible Name: Dolar Americano

Atribua o template ao Host criado.

Faça download do arquivo cotacoes.sh

Altere as variaveis dele

	*/20 * * * * /tmp/zabbix/cotacoes.sh USDBRL >/dev/null
	*/20 * * * * /tmp/zabbix/cotacoes.sh CADBRL >/dev/null
	*/20 * * * * /tmp/zabbix/cotacoes.sh EURBRL >/dev/null
	*/20 * * * * /tmp/zabbix/cotacoes.sh AUDBRL >/dev/null


OBS.: Eu fiz apenas para essas 4 moedas, mas se voce quiser monitorar outra, basta seguir a mesma linha de raciocinio.

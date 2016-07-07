Coletando as informações de lentidão do transito conforme o site da CET SP


Import o Template_CETSP

Crie um Host com o nome de CETSP, atribua o Template_CETSP a ele.

Faça download do script cetsp.sh

Altere as variaveis dentro dele:


Coloque na crontab para coletar os dados e enviar para o Zabbix de 5 em 5 minutos.

	*/5 * * * * /root/www.redhate.me/github/OutOfBox/CETSP/cetsp.sh norte
	*/5 * * * * /root/www.redhate.me/github/OutOfBox/CETSP/cetsp.sh sul
	*/5 * * * * /root/www.redhate.me/github/OutOfBox/CETSP/cetsp.sh leste
	*/5 * * * * /root/www.redhate.me/github/OutOfBox/CETSP/cetsp.sh oeste
	*/5 * * * * /root/www.redhate.me/github/OutOfBox/CETSP/cetsp.sh centro
	

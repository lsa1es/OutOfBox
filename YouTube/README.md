Template para Zabbix que coleta dados de Videos do Youtube via API

Importe o Template_Youtube.xml

Crie um Host seguindo a seguinte estrutura

Host Name: ID_DO_VIDEO ( 4ExwNEWXz38 )

Visible Name: NOME_DO_VIDEO ( HOMENAGEM )

Atribua o template ao Host criado.

Faça download do arquivo youtube.sh

Altere as variaveis dele

VID = ids dos videos..
Ex: https://www.youtube.com/watch?v=TiUK8oyKY70
VID é o "TiUK8oyKY70"

Feito isso ponha na crontab:

  */50 * * * * /root/yout.sh  >/dev/null

OBS: O Youtube tem limite de requests da API de forma gratuita. Por isso pus a cada 50 minutos.


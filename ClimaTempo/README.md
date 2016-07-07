Template para Zabbix para coleta de dados de Clima com base no site Clima Tempo

Importe o Template_Climatempo.xml

Crie um Host seguindo a seguinte estrutura

Host Name: UF
Visible Name: Nome do Estado

Atribua o template ao Host criado.

Faça download do arquivo ClimaTempo.sh

Altere as variaveis dele
ZABBIX_SERVER

Ponha no Crontab 

  */5 * * * * /tmp/zabbix/Climatempo.sh br >/dev/null
  
OBS.: Eu criei todas as UFs e os Estados, entao o script está enviando para todos, caso voce queira pegar uma cidade ou regiao em especifico, basta editar o script e seguir a mesma logica.


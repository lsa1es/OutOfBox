import requests
import json
import sys

OPC = sys.argv[1]
response = requests.get("http://interessados.divulgacao.tse.jus.br/2018/divulgacao/oficial/295/dadosdivweb/br/br-c0001-e000295-w.js")
data = response.json()
out = {'data': []}

if OPC == 'lld':
	for q in data['cand']:
		Nome = q[u'nm']
		Numero = q[u'n']
		lld = {"{#CANDIDATO}": Nome, "{#NUMERO}": Numero }
		out['data'].append(lld)	

	print(json.dumps(out, indent=4, sort_keys=True))

elif OPC == 'vap':
	NUMERO = sys.argv[2]
	for q in data['cand']:
		if NUMERO == q[u'n']:
			print q[u'vap']

elif OPC == 'vt':
	NUMERO = sys.argv[2]
	for q in data['cand']:
		if NUMERO == q[u'n']:
			print q[u'v']
	

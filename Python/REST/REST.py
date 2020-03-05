#pip install requests

import requests
import json

r=requests.get('http://plataformaofertas.pmenos.com.br/api_plataforma_ofertas/Obter_Ofertas_Por_CPF?cpf=644.193.393-49&canal=4&filial=1071')
r.json()

print (r.json())
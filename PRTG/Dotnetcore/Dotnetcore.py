import sys
import time
import paramiko
import time
espaco = ' '
ip  = '10.11.100.19'
usuario = '99936'
sudo = 'sudo supervisorctl start'
passwd = 'xy2030!km1'
#arquivo = open('PASSWD.txt', 'r')
#passwd = arquivo.readline()
#print(arquivo)

servicesName = 'apipedidospendentesportalfornecedor'
entradaSomada = sudo + espaco + servicesName
print("Senha Do Arquivo:\n", passwd)
print("Nome do Servico:\n", servicesName)
print ("Comando Executado:\n", entradaSomada)
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = ip, port = 22, username = usuario, password = passwd, look_for_keys=False, allow_agent=False, timeout=100)
stdin,stdout,stderr=ssh.exec_command(entradaSomada, get_pty=False)
stdout.read()
stderr.read()
stdin.read()
ssh.close()

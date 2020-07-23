import sys
import time
import paramiko
usuario = 'USER'
#ip = ['10.11' , '10.11']

ip = 'ENDERECO' # HOMO

comando = 'sudo docker start'
espaco = ' '
arquivo = open('C:\FonteDesenvolvimentoSamir\Python\PASSWD.txt', 'r')
passwd = arquivo.readline()
print(passwd)
servicesName = 'trademarketing_services_trademarketing-principal_1'
print(servicesName)
entradaSomada = comando + espaco + servicesName
print("#-- Senha Do Arquivo:\n", passwd)
print("#-- Nome do Servico:\n", servicesName)
print("#-- Comando Executado:\n", entradaSomada)

#y = 0
#for y in range(1):
#    print("#-- Acessando:\n", ip[y])
#    conectionService(ip[y], usuario, passwd, entradaSomada)

print("#-- Passou Aqui\n")
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
#ssh.connect(hostname=ip, port=22, username=usuario, password=passwd, look_for_keys=False, allow_agent=False, timeout=100)
ssh.connect(hostname=ip, port=22, username=usuario, password=passwd)
stdin, stdout, stderr = ssh.exec_command('ls -la', get_pty=True)
stdout.read()
#stdin, stdout, stderr = ssh.exec_command(entradaSomada, get_pty=False)
#stdout.read()
stderr.read()
#stdin.read()

#
# ssh.close()
import sys
import time
import paramiko
usuario = 'USER'
ip  = 'ENDERECO'
comando = 'sudo docker start'
espaco = ' '
arquivo = open('C:\FonteDesenvolvimentoSamir\Python\Morpheus\PASSWD_MORPHEUS.txt', 'r')
passwd = arquivo.readline()
print(passwd) 
servicesName = 'deliveryservices_deliveryservices.filial_1'
print(servicesName) 
entradaSomada = comando + espaco + servicesName
print("_ Senha Do Arquivo:", passwd)
print("_ Nome do Servico:", servicesName)
print ("_ Comando Executado:", entradaSomada)
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh.connect(hostname = ip, port = 22, username = usuario, password = passwd, look_for_keys=True, allow_agent=True, timeout=100)
stdin,stdout,stderr=ssh.exec_command('ls -la', get_pty=True)
stdout.read()

stdin,stdout,stderr=ssh.exec_command(entradaSomada, get_pty=True)
stdout.read()
#stderr.read()
stdin.read()
ssh.close()

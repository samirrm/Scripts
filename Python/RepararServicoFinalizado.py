import sys
import time
import paramiko
usuario = 'USER'
ip  = '10.11.100.12'
comando = 'sudo pm2 restart'
espaco = ' '
arquivo = open('C:\FonteDesenvolvimentoSamir\Python\PASSWD.txt', 'r')
passwd = arquivo.readline()
print(passwd) 
servicesName = 'API_Portal_Sempre'
print(servicesName) 
entradaSomada = comando + espaco + servicesName
print("Senha Do Arquivo:", passwd)
print("Nome do Servico:", servicesName)
print ("Comando Executado:", entradaSomada)
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = ip, port = 22, username = usuario, password = passwd, look_for_keys=False, allow_agent=False, timeout=100)
stdin,stdout,stderr=ssh.exec_command('ls -la', get_pty=True)
stdout.read()

stdin,stdout,stderr=ssh.exec_command(entradaSomada, get_pty=False)
stdout.read()
stderr.read()
stdin.read()
ssh.close()

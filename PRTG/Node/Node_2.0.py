import sys
import time
import paramiko
import time
espaco = ' '
ip  = '10.11.100.12'
usuario = '99936'
sudo = 'sudo pm2 restart'
arquivo = open('C:\Program Files\Python37\reparaservicos\deploy\node\PASSWD.txt', 'r')
passwd = arquivo.readline()
servicesName = 'API_Portal_Sempre'
entradaSomada = sudo + espaco + servicesName
print("Senha Do Arquivo:", passwd)
print("Nome do Servico:", servicesName)
print ("Comando Executado:", entradaSomada)
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = ip, port = 22, username = usuario, password = passwd, look_for_keys=False, allow_agent=False, timeout=100)
stdin,stdout,stderr=ssh.exec_command(entradaSomada, get_pty=False)
stdout.read()
stderr.read()
stdin.read()
ssh.close()

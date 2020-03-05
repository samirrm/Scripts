import os 
import sys 
import paramiko 
import time 
espaco = ' ' 
ip  = '10.11.100.39' 
usuario = '99936' 
sudo = 'sudo docker start' 
arquivo = open('PASSWD.txt', 'r') 
passwd = arquivo.readline() 
servicesName = 'trademarketing_services_trademarketing-principal_1' 
entradaSomada = sudo + espaco + servicesName 
print("Senha Do Arquivo:",passwd) 
print("Nome do Servico:",servicesName) 
print ("Comandon Executado:",entradaSomada) 
ssh = paramiko.SSHClient() 
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) 
ssh.connect(hostname = ip, port = 22 , username = usuario, password = passwd) 
sudo + servicesName 
stdin,stdout,stderr=ssh.exec_command(entradaSomada, get_pty=True) 
stdout.read() 
ssh.close() 

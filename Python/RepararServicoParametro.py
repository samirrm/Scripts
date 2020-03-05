import os
import sys
import paramiko
import time

ip  = '10.11.11.11'
usuario = 'USER'

arquivo = open('PASSWD.txt', 'r')
passwd = arquivo.readline()
servicesNameStart = str(sys.argv[1])
print(servicesNameStart)

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = ip, port = 22 , username = usuario, password = passwd)

stdin,stdout,stderr=ssh.exec_command(servicesNameStart, get_pty=True)
stdout.read()
ssh.close()
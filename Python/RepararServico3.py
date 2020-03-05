import os
import sys
import paramiko
import socket
import logging

logger = paramiko.util.logging.getLogger()
logger.setLevel(logging.DEBUG)
paramiko.util.log_to_file("LogSSH.log")

#cmd = 'docker stop 414ef3abc0bf'

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = '172.17.21.7', port = 22, username = 'USER', password = 'SENHA')
#stdin, stdout, stderr = ssh.exec_command('sudo docker stop 414ef3abc0bf')

chan = ssh.invoke_shell()

#Commando:

chan.send('sudo docker stop 414ef3abc0bf\n') 
print(chan)

#return resp
ssh.close
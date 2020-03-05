import os
import sys
import paramiko
import time

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = '10.10.10.11', port = 22 , username = 'USUER', password = 'PASS')

stdin, stdout, stderr = ssh.exec_command('ls -l', get_pty=True)
if stdout.channel.recv_exit_status() != 0:
    stdout.read()

stdin, stdout, stderr = ssh.exec_command('sudo docker stop adae0d77a264', get_pty=True)
#stdin.read()
if stdout.channel.recv_exit_status() != 0:
    stdout.read()
    stderr.read()

#print (stdout.read())
#chan = ssh.invoke_shell()
#Commando:
#chan.send('sudo docker stop 414ef3abc0bf')

ssh.close()
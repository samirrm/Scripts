import logging
import time
import datetime
import sys
import subprocess
import os
import sys
import json

def initiateSSH (host):
#import paramiko
import cmd
import time
import sys
import socketdoc
import os

usrpassword = "senha"
cmd = "docker stop 414ef3abc0bf"
#host = "10.11.10.10"

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

ssh.connect('10.11.10.010', username='USER', password='usrpassword')
chan = ssh.invoke_shell()
time.sleep(delay)

#Send command:

chan.send(cmd)

return resp
ssh.close
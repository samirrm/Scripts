import os
import sys
import paramiko
import time
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname = '10.11.11.110', port = 22 , username = 'USER', password = 'PASS',look_for_keys=False, allow_agent=False, timeout=100)
stdin,stdout,stderr=ssh.exec_command('ls -la', get_pty=True)
ssh.close()
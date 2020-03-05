import paramiko
import time
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
arquivo = open('comandos.txt','r')
leitor = arquivo.readlines()
ssh.connect(hostname = '192.168.0.254', port = 22, username = 'admin', password = 'admin')
conexao = ssh.invoke_shell()
for comandos in leitor:
    conexao.send('{}\n'.format(comandos))
    time.sleep(1)
    output = conexao.recv(65535)
    print(output.split()[2])
ssh.close()
#print(output[4])

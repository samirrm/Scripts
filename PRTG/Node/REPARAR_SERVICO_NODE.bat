set mypath=%1
echo import os > "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo import sys >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo import paramiko >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo import time >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo espaco = ' ' >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo ip  = '10.11.100.12' >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo usuario = '99936' >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo sudo = 'sudo pm2 restart' >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo arquivo = open('PASSWD.txt', 'r') >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo passwd = arquivo.readline() >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo servicesName = '%1' >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo entradaSomada = sudo + espaco + servicesName >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo print("Senha Do Arquivo:",passwd) >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo print("Nome do Servico:",servicesName) >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo print ("Comandon Executado:",entradaSomada) >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo ssh = paramiko.SSHClient() >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy()) >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo ssh.connect(hostname = ip, port = 22 , username = usuario, password = passwd, look_for_keys=False, allow_agent=False, timeout=100) >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo stdin,stdout,stderr=ssh.exec_command(entradaSomada, get_pty=True) >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo stdout.read() >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo stderr.read() >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo stdin.read() >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"
echo ssh.close() >> "C:\Program Files\Python37\reparaservicos\deploy\node\%mypath%.py"

cd\Program Files\Python37\reparaservicos\deploy\node
python.exe %mypath%.py
exit
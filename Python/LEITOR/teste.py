import time
arq = open('comandos.txt','r')
teste = arq.readlines()
for i in teste:
    print (i)
    time.sleep(1)

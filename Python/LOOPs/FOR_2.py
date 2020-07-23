import sys
import time

def conectionService(ip):
    print("Ip na Funcao:", ip)

ip = ['10.11.10','10.11.1', '10.11.2']
#y = 2
for y in range(2):
    print("#-- IP NO For:\n", ip[y])
    conectionService(ip[y])
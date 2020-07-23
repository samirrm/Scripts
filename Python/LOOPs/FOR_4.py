import sys
import time

arquivo = open('C:\FonteDesenvolvimentoSamir\Python\DESTINOS.txt', 'w')
arquivo.write('172.17.1.1\n')
arquivo.write('172.17.1.2\n')
arquivo.write('172.17.1.3\n')
arquivo.close()

arquivo = open('C:\FonteDesenvolvimentoSamir\Python\DESTINOS.txt', 'r')
destinos = []
for linha in arquivo:
    linha = linha.strip()
    destinos.append(linha)
    print(linha)
arquivo.close()

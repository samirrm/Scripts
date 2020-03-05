arquivo = open('teste.txt', 'r')
linha = arquivo.readline()
for linha in arquivo:
    print(linha)

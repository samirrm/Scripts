# -*- coding: UTF-8 -*-

#arquivo app.py
import re
def cadastrar(nomes):
    print 'Digite o nome:'
    nome = raw_input()
    nomes.append(nome)

def listar(nomes):
    print 'Listando nomes:'
    for nome in nomes:
        print nome

def remover(nomes):
    print 'Qual nome gostaria de remover?'
    nome = raw_input()
    nomes.remove(nome)

def alterar(nomes):
    print 'Qual o nome gostaria de alterar?'
    nome = raw_input()
    if nome in nomes:
        posicao = nome.index(nome) 	
        posicao = nome
    print 'Digite novo nome:'
        nome_novo = raw_input()
        nomes[posicao] = nome_novo

def procurar_regex(nomes):
    print('Digite a expressão regular')
    regex = raw_input()
    nomes_concatenados = ' '.join(nomes)
    resultados = re.findall(regex, nomes_concatenados)
    print(resultados)
	
def menu():
    nomes = []
    escolha = ''
    while(escolha != '0'):    
        print 'Digite 1 para cadastrar, 2 para listar, 3 para remover, 4 para alterar, 0 para terminar'
        escolha = raw_input()

        if(escolha == '1'):
            cadastrar(nomes)

        if(escolha == '2'):
            listar(nomes)

        if(escolha == '3'):
            remover(nomes)
        
		if(escolha == '4'):
            alterar(nomes)
menu()
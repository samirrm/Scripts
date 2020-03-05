

def funcao(num1,num2,num3):
    if num1 > num2:
        return num1
    elif num2 > num1:
        return num2
    elif (num3 > num1):
        return num3
    else:
        print("4 - Nada")

print ("1 - Maior Número:",funcao(2,4,0))
print ("2 - Maior Número:",funcao(3,1,0))
print ("3 - Maior Número:",funcao(0,0,7))


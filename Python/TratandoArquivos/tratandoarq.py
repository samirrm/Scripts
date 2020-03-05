import time
arq = open('teste.txt','r')
var = arq.readlines()
for new_var in var:
    new_var = new_var.replace('\n','')

    print(new_var)
#for i in new_var:
#    print (i)
#    time.sleep(1)

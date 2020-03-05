import sys

def Factorial(n): # return factorial
    result = 1
    for i in range (1,n):
        result = result * i
    print "factorial is ",result
    return result

print Factorial(10)
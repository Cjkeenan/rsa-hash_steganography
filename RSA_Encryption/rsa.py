def euclidAlgo(larger, smaller):
    if(smaller > larger):
        temp = larger
        larger = smaller
        smaller = temp
    
    rem = larger % smaller

    if(rem == 0):
        return smaller
    
    return euclidAlgo(smaller, rem)

def extEuclidAlgo(a, b):
    a, b = abs(a), abs(b)
    x0, x1, y0, y1 = 1, 0, 0, 1
    while b != 0:
        q, a, b = a // b, b, a % b
        x0, x1 = x1, x0 - q * x1
        y0, y1 = y1, y0 - q * y1
    return a, x0, y0

def generatePublic(p,q):
    n = p*q
    phi = (p-1)*(q-1)

    e = 2
    while(euclidAlgo(e,phi) != 1):
        e = e+1
    if(e >= phi):
        return( "not possible since e < phi(n), phi(n)={0} and e = {1}" .format(phi,e))
    return e

def generatePrivate(e,n):
    phi = eulerPhi(n)
    gcd = euclidAlgo(e,phi)
    if(gcd == 1):
        d = extEuclidAlgo(e,phi)[1]
    else:
        return ("not possible since the gcd of {0} and {1} is {2} and not 1" .format(e,phi,gcd))

    return d

def primeFactors(number):
    factors = []
    for i in range(2, number + 1):
        if(number % i == 0):
            prime = True
            for j in range(2, (i//2 + 1)):
                if(i % j == 0):
                    prime = False
                    break               
            if (prime):
                factors.append(i)
    return factors

def eulerPhi(n):
    factors = primeFactors(n)
    phi = n
    for i in range (0, len(factors)):
        temp = 1 - (1/factors[i])
        phi *= temp
    return int(phi)

def encryptRSA(x,e,n):
    return pow(x,e,n)

def decryptRSA(y,d,n):
    return pow(y,d,n)

def paarExample():
    print("Paar Example, p=3, q=11")
    p = 3
    q = 11
    e = generatePublic(p,q)
    d = generatePrivate(e,p*q)
    print("phi: {0}" .format(eulerPhi(p*q)))
    print("encryption key: {0}" .format(e))
    print("decryption key: {0}" .format(d))

def e3p11a():
    print("\nExercise 3, Problem 11a")
    e = 13
    n = 2881
    d = generatePrivate(e,n)
    print("decryption key: {0}" .format(d))

def e3p11b():
    print("\nExercise 3, Problem 11b")
    e = 7
    n = 2881
    d = generatePrivate(e,n)
    print("decryption key: {0}" .format(d))

def e3p12():
    print("\nExercise 3, Problem 12")
    e = 13
    n = 35209
    d = generatePrivate(e,n)
    print("decryption key: {0}" .format(d))

def e3p14():
    print("\nExercise 3, Problem 14")
    n = [1997,1999,2001,2002,2003,2004,2005]
    phi = [0,0,0,0,0,0,0]
    for i in range (0,len(n)):
        phi[i] = eulerPhi(n[i])
        print("phi({0}) = {1}" .format(n[i],phi[i]))

def e3pEC():
    print("\nExercise 3, Extra Credit")
    e = 13
    n = 2881
    d = generatePrivate(e,n)
    text = "To be, or not to be- that is the question: Whether 'tis nobler in the mind to suffer The slings and arrows of outrageous fortune Or to take arms against a sea of troubles, And by opposing end them. To die- to sleep- No more; and by a sleep to say we end The heartache, and the thousand natural shocks That flesh is heir to. 'Tis a consummation Devoutly to be wish'd. To die- to sleep. To sleep- perchance to dream: ay, there's the rub!"
    textEncoded = list(text.encode())

    textEncrypted = []
    for i in range(0,len(textEncoded)):
        textEncrypted.append(encryptRSA(textEncoded[i],e,n))

    textDecrypted = []
    for i in range(0,len(textEncrypted)):
        textDecrypted.append(decryptRSA(textEncrypted[i],d,n))

    textDecryptedPT = bytes(textDecrypted).decode()
    print("Original Text: {0}" .format(text))
    print("Encoded Text: {0}" .format(textEncoded))
    print("Encrypted Encoded Text: {0}" .format(textEncrypted))
    print("Decrypted Encoded Text: {0}" .format(textDecrypted))
    print("Decrypted Decoded Text: {0}" .format(textDecryptedPT))

part = "start"
while(part != "exit"):
    part = input("Which question would you like to display? [11a, 11b, 12, 14, or EC]: ")
    if(part == "11a"):
        e3p11a()
    elif(part == "11b"):
        e3p11b()
    elif(part == "12"):
        e3p12()
    elif(part == "14"):
        e3p14()
    elif(part == "EC"):
        e3pEC()
    elif(part == "all"):
        e3p11a()
        e3p11b()
        e3p12()
        e3p14()
        e3pEC()
import hashlib
md5 = "b5b08012876f1736971b145f1156c7fa"
with open("wordlist.txt") as fname:
        lineas = fname.readlines()
        print(hashlib.md5(lineas[0].encode()))
        for linea in lineas:
                string = 'p4sswd' + linea.replace('\n','') 
                try:
                        if (hashlib.md5(string.encode('utf-8')).hexdigest() == md5):
                                print string
                except:
                        continue

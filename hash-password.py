import hashlib
md5 = "2b51a4287ea2c750614f9eccfd505416"
with open("wordlist.txt") as fname:
        lineas = fname.readlines()
        print(hashlib.md5(lineas[0].encode()))
        for linea in lineas:
                string = linea.replace('\n','') + "p4sswd"
                try:
                        if (hashlib.md5(string.encode('utf-8')).hexdigest() == md5):
                                print string
                except:
                        continue

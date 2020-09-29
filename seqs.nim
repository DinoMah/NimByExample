var
    a = @[1, 2, 3]
    b = newSeq[int](3)

for i, v in a:
    b[i] = v*v

for i in 4..100:
    b.add(i * i)

b.delete(0)
b = a[0] & b

# Secuencias por valor no pueden ser modificadas mientras que por referencia si
# Se usa var o ref antes de seq para indicar que es por referencia
proc foo (mySeq :var seq[int]) = mySeq[9] = 999

var thisSeq = newSeq[int](10)
foo(thisSeq)
type 
    CustomRange = object
        min :int
        max :int

# Items and Pairs
iterator items(range :CustomRange) :int =
    var i = range.min
    while i <= range.max:
        yield i
        inc i

iterator pairs(range :CustomRange) :tuple[a :int, b :char] =
    for i in range:
        yield (i, char(i + ord('a')))

# end Items and Pairs

# Three dot operator from ruby (kinda)
iterator `...`*[T](a :T, b :T) :T =
    var res :T = T(a)
    while res <= b:
        yield res
        inc res

# end Three dot operator from ruby (kinda)

# Inline iterators

iterator countTo(n :int) :int =
    var i = 0
    while i <= n:
        yield i
        inc i

# end Inline iterators

#[for i, c in CustomRange(min: 1, max: 3):
    echo c

for i in 0...5:
    echo i

for i in countTo(10):
    echo i
]#

# Closure Iterators
proc contarHasta(n :int) :iterator() :int =
    return iterator() :int =
        var i = 0
        while i <= n:
            yield i
            inc i

let countTo20 = contarHasta(20)

#echo countTo20()

# Raw iterator usage
var output = ""
while true:
    let next = countTo20()
    if finished(countTo20):
        break
    output.add($next & " ")

echo output

output = ""
let countTo9 = contarHasta(9)
for i in countTo9():
    output.add($i)
echo output
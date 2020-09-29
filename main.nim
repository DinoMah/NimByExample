# Casting
var x = int(1.0 / 3)

var y :seq[int] = @[]

var z = "Foobar"

proc ffi(foo :ptr array[6, char]) = echo repr(foo)

ffi(cast[ptr array[6, char]](addr z[0]))

# Case
case 'h':
    of 'a', 'e', 'i', 'o', 'u':
        echo "Vocal"
    of '\127'..'\255':
        echo "Unknown"
    else:
        echo "Consonant"

proc positiveNegativeOrZero(num :int) :string =
    result = case num:
        of low(int).. -1:
            "negative"
        of 0:
            "zero"
        of 1..high(int):
            "positive"

echo positiveNegativeOrZero(-1)

# Block
block busyloops:
    while true:
        while true:
            break busyloops
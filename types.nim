# Types in Nim

# Primitives
var num1 :int8
var num2 :int16
var num3 :int32
var num4 :int64
var num5 :int #  Tamaño de un puntero

var num6 :uint # Para números sin signo se le agrega u al inicio

# Los números pueden ser en hexadecimal, octal o binarios con los prefijos 0[xX], 0o y 0[Bb] respectivamente
# Se pueden poner guiones bajos para separar números, por ejemplo 0b1111_1111

var num7 = 0f # Indica un número flotante y donde float es del tipo más rápido del procesador (32 o 64)
var letra :char

# En vez de operadores ^, &, |, >>, << se usan xor, and, or, shr, shl respectivamente
# El operador / devuelve siempre un flotante si quieres un entero haz una conversión

# Se pueden poner alias a los tipos por ejemplo:
type
    Entero* = int
let a :Entero = 2
discard a + Entero(2) # Discard no sé que hace, no sé si ignora lo del lado derecho

# Objetos
type
    Animal* = object
        name*, species* :string
        age :int

proc sleep* (a :var Animal) =
    a.age += 1

proc dead* (a :Animal) :bool =
    result = a.age > 20

var carl :Animal
carl = Animal(name:"Carl", species:"L. glama", age:12)
let joe = Animal(name: "Joe", species: "H. sapiens", age: 23)

assert(not carl.dead)

for i in 0..10:
    carl.sleep()

assert carl.dead

# Esta es una referencia a un objeto en el heap
let mittens :ref Animal = new(Animal)

mittens.name = "Mittens"
mittens.species = "P. leo"
mittens.age = 6
# This can't be, because the reference is immutable
# mittens.sleep()

# Enums
type
    CompassDirections = enum
        cdNorth, cdEast, cdSouth, cdWest

    Colors {.pure.} = enum
        Red = "FF0000", Green = (1, "00FF00"), Blue = "0000FF"

    Signals = enum
        sigQuit = 3, sigAbort = 6, sigKill = 9

for direction in ord(low(CompassDirections))..ord(high(CompassDirections)):
    echo CompassDirections(direction), " ord: ", direction

var ordinal = low(int)
inc ordinal
dec ordinal
echo high(char)

# Distinct types
type
    Dollars* = distinct float
var dolares = 20.Dollars
dolares = 25.Dollars

# Using distinct types doesn't have type's procedures, for that you should use {.borrow.} pragma
proc `*`* (a, b :Dollars) :Dollars {.borrow.}
proc `+`* (a, b :Dollars) :Dollars {.borrow.}
dolares = 20.Dollars * 20.Dollars

# When creating a distinct type from an object type, none of the fields are carried over. If the field are wanted, overload {.borrow.}
# pragma.
type
    Foo = object
        a :int
    MyFoo {.borrow: `.`.} = distinct Foo

var value :MyFoo
echo value.a
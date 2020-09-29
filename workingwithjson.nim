# Modulo para usar información JSON
import json

let elemento = "Hidrogeno"
let numeroAtomico = 1

let objetoJson = %* {"elemento": elemento, "numeroAtomico": numeroAtomico} # El operador %* se usa para crear un objeto json
echo $objetoJson # El operador $ convierte el objeto en cadena

let objetoJson1 = """{"name": "Sky", "age": 32}"""
let arregloJson = """[7, 8, 9]"""

let objetoConvertido = parseJson(objetoJson1) # parseJson convierte una cadena en un objeto JSON
let name = objetoConvertido["name"].getStr() # Así se obtiene un elemento del objeto JSON
echo name

let arregloConvertido = parseJson(arregloJson) # parseJson convierte un arreglo en un objeto JSON
let ocho = arregloConvertido[1].getInt() # Así se obtiene un elemento en un array JSON
echo ocho

# Para convertir de un JSON a un objeto se hace de la siguiente manera:
type
    Elemento = object
        name :string
        numeroAtomico :int

let objetoJson2 = parseJson("""{"name": "Carbon", "numeroAtomico": 6}""")
let element = to(objetoJson2, Elemento)
echo element.name
echo element.numeroAtomico
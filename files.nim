# Tenemos un archivo en el mismo directorio que nuestro archivo .nim, se llama gatos.txt y tiene el siguiente contenido:
# escupefuego
# viviano
# motor
# Podemos usar el procedimiento readFile para leer todo el archivo y ponerlo en memoria
let archivoCompleto = readFile("gatos.txt")
echo archivoCompleto
# También podemos leer línea por línea con el procedimiento readLine abriendo el objeto File:
let archivo = open("gatos.txt")
let primerLinea = archivo.readLine()
echo primerLinea
archivo.close() # Cierra el archivo
# Para escribir en un archivo se usa el procedimiento writeFile
let texto = "¡Los gatos son geniales!"
writeFile("gatos.txt", texto) # Borra el contenido e inserta la cadena, si el archivo no existe lo crea
# Podemos escribir archivos línea por línea usando el objeto File y el procedimiento writeLine
let lines = ["Play", "Eat", "Sleep"] # Contenido a escribir
let archivo1 = open("agregaractividades.txt", fmWrite)

for linea in lines:
    archivo1.writeLine(linea)
archivo1.close()

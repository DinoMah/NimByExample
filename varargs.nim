# varargs te permite enviar varios parámetros a una función.
proc printThings (things :varargs[string]) =
    for thing in things:
        echo thing

printThings "words", "to", "print"

# enviar diferentes tipos de parámetros resultará en un error
# si quieres enviar parametros de diferentes tipos como string a un parametro se hace como sigue:
proc printDifferentThings (things :varargs[string, `$`]) =
    for thing in things:
        echo thing

printDifferentThings "thing 1", 2, @[4, 5, 6]
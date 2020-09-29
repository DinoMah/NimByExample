# Arrays
# arrays are c-like, their size cannot be changed at compile or run time

type
    ThreeStringAddress = array[3, string]
let names :ThreeStringAddress = ["Jasmine", "Ktisztina", "Kristof"]
let addresses :ThreeStringAddress = ["101 Betbugweg", "66 Bellion Drive", "194 Laarderweg"]

proc zip[I, T] (a, b :array[I, T]) :array[I, tuple[a, b :T]] =
    for i in low(a)..high(a):
        result[i] = (a[i], b[i])

let nameAndAddresses = names.zip(addresses)

type
    PartsOfSpeech {.pure.} = enum
        Pronoun, Verb, Article, Adjective, Noun, Adverb
let partOfSpeechExamples :array[PartsOfSpeech, string] = [
    "he", "reads", "the", "green", "book", "slowly"
]

type
    Matrix[W, H :static[int]] =
        array[1..W, array[1..H, int]]

let mat1 :Matrix[2, 2] = [
    [1, 0],
    [0, 1]
]

let mat2 :Matrix[2, 2] = [
    [0, 1],
    [1, 0]
]

proc `+`[W, H] (a, b :Matrix[W, H]) :Matrix[W, H] =
    for i in 1..high(a):
        for j in 1..high(a[0]):
            result[i][j] = a[i][j] + b[i][j]

echo mat1 + mat2
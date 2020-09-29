type Animal = ref object of RootObj
    name :string
    age :int
method vocalize (this :Animal) :string {.base.} = "..."
method ageHumanYears (this :Animal) :int {.base.} = this.age

type Dog = ref object of Animal
method vocalize (this :Dog) :string = "Woof"
method ageHumanYears (this :Dog) :int = this.age * 7

type Cat = ref object of Animal
method vocalize (this :Cat) :string = "Meow"

var animals :seq[Animal] = @[]
animals.add(Dog(name: "Sparky", age: 10))
animals.add(Cat(name: "Mitten", age: 10))

for a in animals:
    echo a.vocalize()
    echo a.ageHumanYears()

echo (animals[0] of Dog)
echo (animals[0] of Cat)
echo (animals[0] of Animal)
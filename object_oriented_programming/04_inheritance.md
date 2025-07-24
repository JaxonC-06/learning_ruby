# Inheritance

- Inheritance is when a class **inherits** behavior from another.
- We use inheritance as a way to extract common behavior from classes and share that behavior.

## Class Inheritance

- This is an example of extracting the `speak` method from `GoodDog` to the superclass `Animal`, using inheritance to make the behavior available to `GoodDog` and `Cat`.
```rb
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak   # => Hello!
puts paws.speak     # => Hello!
```
- The `<` symbol is used to specify that `GoodDog` is inheriting from `Animal`.
- That means that all methods of the `Animal` class are now available to `GoodDog`.
- We can override by making a `speak` function in `GoodDog`, since Ruby checks the object before the superclass.
- Inheritance helps us to keep our code **DRY**.

## super

- The `super` keyword calls methods earlier in the lookup path.
- When called withing a method, it searches the method lookup path for a method with the same name, then **invokes** it.
```rb
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak          # => Hello! from GoodDog class
```
- Above, we have extended the functionality of the `speak` method in animal by using `super`.
- We can also use super with `initialize`.
```rb
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")  # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```
- Why is the name "brown"? We need to pass super specific arguments.
```rb
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear") # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```
- Here, `supers takes in an argument which is passed to the superclass.
- If `super` is called like `super()`, it calls the method in the superclass with no arguments at all. If an argument in the superclass takes no arguments, that is the safest way to call it.

## Mixing in Modules

- Modules **DRY** our code.
- The hierarchy of what we've done so far would go: `Animal > Fish, Mammal`, and `Mammal > Cat, Dog`.
- But what if we wanted a `swim` method? All fish swim, but not all mammals do. It doesn't really make sense to have it in Animals, and we can't have it in Fish.
- For concerns like this, we want to group them into a **module** and then mix the module into classes to require behaviors.
```rb
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in swimmable module
end
```
- Now, `Fish` and `Dog` can access `swim`, but the rest won't be able to.

## Inheritance vs Modules

- Traditional inheritance is where classes are used, and **interface inheritance** uses mixin modules.
- **Interface Inheritance** inherits the interface provided by mixin modules.
- These are some things to consider when deciding what to use:
  - You can only **subclass**(class) from one class, but you can mix in as many modules(interface) as you like.
  - If an instance of class B can be described as a king of class A, then we probably won't want to use class inheritance such that class B inherits class A.
  - Objects **can not** be created from modules.

## Method Lookup Path

- The method lookup path is the order in which classes are inspected when a method is called.
```rb
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

puts "---Animal Method lookup---"
puts Animal.ancestors
```
- The above code outputs:
```rb
"---Animal Method lookup---"
Animal
Walkable
Object
Kernel
BasicObject
```
- The lookup path helps us to understand where methods are coming from.

## More Modules

- **Namespacing** means organizing similar classes under a module.
- The makes our code easier to understand and helps it to not collide with other similarly named classes.
- It is done like this:
```rb
module Mammal
  class Dog
    def speak(sound)
      p "#{sound}"
    end
  end

  class Cat
    def say_name(name)
      p "#{name}"
    end
  end
end
```
- We can call these classes by appending them to the module name with two colons:
```rb
buddy = Mammal::Dog.new
kitty = Mammal::Cat.new
```

- Another option we have it to use modules as a container for methods.
- This approach can be useful for methods that seem out of place with the code.
```rb
module Conversations
  def self.fahrenheit_to_celsius(num)
    (num - 32) * 5 / 9
  end
end
```

## Private, Protected, and Public

- restricting access to the methods defined in a class is known as **Method Access Control**.
- To implement this, Ruby provides the `public`, `private`, and `protected` access modifiers.
- The `private` method makes anything below it private.
- `protected` methods also cannot be invoked outside of a their class, but they allows access between class instances, which `private` does not.

## Accidental Method Overriding

- Ruby has a built in `Object` class which all classes have access to.
- We don't want to override a method originally defined in Object, like `send`.
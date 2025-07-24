# The Object Model

## Why Object Oriented Programming?

- OOP is a programming paradigm that was created tro deal with the growing complexity of large applications and systems.
- Programmers needed a way to create containers for data that could be edited without affecting the whole program.
- OOP allows us to section of parts and areas of code.

### Encapsulation

- Encapsulation is one of the fundamental concepts of object oriented programming.
- Encapsulation involves building and combining data and methods which act on it into a single entity, or object.
- Encapsulation hides functionality to make it unavailable to the rest of the code base.
- Essentially, **encapsulation** is about bundling state (data) and behavior (operations) to form an object.
- encapsulation also refers to protecting and restricting access to certain dat5a and methods.

### Polymorphism

- Polymorphism is the ability for different kinds of data to respond to a common interface.
- For example, passing a method that invokes the method `move` on its argument, we can pass the method any argument as long as said argument has a compatible `move` method.

### Inheritance

- Inheritance refers to a class inheriting or acquiring the behavior of another class, referred to as a superclass.
- In Ruby, a module can be mixed with a class using the `include` method. This is called a **mixin**.
- After mixing in a module, the behavior in said module are available to it's classes and objects.

## What Are Objects?

- While not everything in Ruby is an object, anything that can be said to have or hold value is an object.
- Objects in Ruby include classes, modules, strings, arrays, numbers.
- Things that are **not** objects are methods, blocks, and variables.
- Objects are **created** from classes, which are like molds that produce an object.
```rb
"hello".class # => String
```

## Classes Define Objects

- Classes are like basic outline for what an object should be made of and what it should do.
- Classes are defined by replacing `def` with `class`, by using CamelCase, and ending with `end`.
```rb
class TestClass
end

test1 = TestClass.new
```
- The workflow of creating a new object from a class is called **instantiation**.

## Modules

- A module is a collection of **behaviors** that is useable in other classes via **mixins**.
- A module is mixed into a class using the `include` method invocation.
- See the following example, taken from Launch Schools book The Object Model:
```rb
# We want the class GoodDog to have a speak method, but we want
# the speak method to be available to other classes too.

module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")
bob = HumanBeing.new
bob.speak("Hey!")
```
- Above, we mixed in the module Speak so that both classes have access.

## Method Lookup

- Ruby has a distinct lookup path that it follows when each method is called.
- We can do so by using the `ancestors` method on any class.
- Here is an example extending the previous example
```rb
puts "---GoodDog Ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing Ancestors---"
puts HumanBeing.ancestors
```
- The output looks like this:
```ruby
---GoodDog Ancestors---
GoodDog
Speak
Object
Kernel
BasicObject

---HumanBeing Ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject
```
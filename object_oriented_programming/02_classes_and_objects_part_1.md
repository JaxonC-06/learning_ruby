# Classes & Objects - Part 1

## States & Behaviors

- When defining a class, we focus on **state** and **behavior**.
- state refers to the data associated with an object, and behaviors are what objects are capable of doing.
- Using the `GoodDog` example from [The Object Model](/object_oriented_programming/the_object_model.md), we could create two different objects containing different data.
- We use instance variables, or variables scoped at the level of the object, to track this info.
- Instance variables keep track of state, and instance methods expose behavior for objects.

## Initializing a New Object

- Here is an example of the initialize method:
```rb
class GoodDog
  def initialize
    puts "This object is initialized!"
  end
end

sparky = GoodDog.new # =>  "This object is initialized!"
```
- The `initialize` method is called every time we create a new object.
- We refer to the `initialize` method as the `constructor`, because it builds up the object once it is created.

## Instance Variables

- An instance variable begins with the `@` symbol, like this:
```rb
class GoodDog
  def initialize(name)
    @name = name
  end
end
```
- This variable exists as long as the object instance exists, and is how we tie data to objects.
- Arguments can be passed to the `initialize` method through the `new` method.
```rb
sparky = GoodDog.new("Sparky")
```
- Every object's state is **distinct**, and instance variables are how we keep track.

### Composition & Aggregation

- Composition and Aggregation are design principles used to establish relationships between classes.
- The both involve instance variables, but they differ in terms of lifecycle and ownership.

#### Composition

- Composition is a relationship where an object (container) contains one or more objects of other classes as part of it's state.
- Essentially, the lifetimes of the container and the composed objects are dependant on each other.
- Composition is typically implemented with instance variables. Here is an example:
```rb
class Engine
  def start
    puts "Engine starting..."
  end
end

class Car
  def initialize
    @engine = Engine.new
  end

  def start
    @engine.start
  end
end
```
- `Car` has an `Engine`, and if the car is destroyed, so is it's engine.

#### Aggregation

- The lifetime of the contained objects **does not** depend on the lifetime of the container.
- Here is an example:
```rb
class Passenger
end

class Car
  def initialize(passengers)
    @passengers = passengers
  end
end

# Passengers can exist without a car
passengers = [Passenger.new, Passenger.new]
my_car = Car.new(passengers)
```
- The `Passenger` objects exist independently of the `Car` instance, and can be passed to `Car` anytime before car is destroyed.

#### The Main Difference

- Composition: The container **owns** the contained objects, and their life cycle are tightly linked.
- Aggregation: The container **does not own** the contained objects, and they can exist independently.

## Instance Methods

- Lets add some behavior to GoodDog:
```rb
class GoodDog
  def initialize
    @name = name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
sparky.speak
```
- We can use the `#{}` syntax to access instance variables within the class.

## Accessor Methods

- If we want to access an objects name, stored inside of the `@name` instance variable, we need a method to return the name:
```rb
class GoodDog
  def initialize
    @name = name
  end

  def get_name
    @name
  end

  def speak
    "#{@name} says Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
```
- What if we want to **change** `@name`? Inside of `GoodDog`, we could put:
```rb
def set_name=(name)
  @name = name
end

# Outside of GoodDog...
sparky.set_name = "Spartacus"
puts sparky.get_name # => Spartacus
```

- To clean this up, inside of `GoodDog` we could just do:
```rb
def name
  @name
end

def name=(n)
  @name = n
end
```

- Ruby provides the `attr_accessor` method to automatically create getter and setter methods.
- We see this by refactoring our `GoodDog` code.
```rb
class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.name # => Sparky
sparky.name = "Spartacus"
puts sparky.name # => Spartacus
```
- If we want to track more instance variables, we can use this syntax:
```rb
attr_accessor :name, :height, :weight
```

- If we were to add a method which altered all of the attributes, we would need `self.name=` syntax.
```rb
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```
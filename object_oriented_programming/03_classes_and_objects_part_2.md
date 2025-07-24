# Classes & Objects - Part 2

## Class Methods

- Class methods can be called directly on the class itself **without** having to instantiate any objects.
- When defining a class method, we prepend the method name with `.self`.
```rb
def self.what_am_i
  "I'm a GoodDog class!"
end

# Outside of GoodDog...

GoodDog.what_am_i # => I'm a GoodDog class!
```
- Class methods are where we put functionality that **doesn't**  pertain to individual objects.
- If we don't need to deal with individual object state, we use class methods.

## Class Variables

- Variables for an entire class are named class variables.
- Class variables are created with two `@` symbols, like `@@`.
```rb
class GoodDog
  @@number_of_dogs = 0

  def initializes
    @@number_of_dogs += 1
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end

puts GoodDog.total_number_of_dogs # => 0

dog1 = GoodDog.new
dog2 = GoodDog.new

puts GoodDog.total_number_of_dogs # => 2
```
- Class variables are used to keep track of data pertaining to the entire class, and can be accessed with instance methods.

## Constants

- Constants are defined by using an uppercase letter at the beginning of a variable name.
- Most Ruby programmers will put the entire constant name in UPPERCASE.
```rb
class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initializes(n, a)
    self.name = n
    self.age = a * DOG_YEARS
  end
end

sparky = GoodDog.new("Sparky", 4)
puts sparky.age # => 28
```

## The to_s Method

- The puts method calls `to_s`, on it's argument.
- By default, the `to_s` method returns the name of the objects class and the encoding of the object id.
```rb
puts sparky      # => #<GoodDog:0x007fe54323320>
```
- `puts` calls `to_s` on any argument that is not an array. It instead calls a separate argument writing `to_s` on each line in the array.
- The method `p` is very similar to `puts` except that it doesn't call `to_s` on it's argument, it calls `inspect`.
- `inspect` is very helpful for debugging purposes.
- `to_s` is automatically called in string interpolation.
- The behavior of `to_s` can be overridden in a class.
- If overriding `to_s`, we **must** remember that Ruby expects `to_s` to always return a string.
- If it does not return a string, `to_s` won't work as expected in places where it is implicitly invoked, like `puts` and interpolation.
- Instead of printing the value returned by `to_s`, Ruby will look to the inheritance chain for another version of `to_s` that does return a string. For example:
```ruby
class Foo
  def to_s
    42
  end
end

foo = Foo.new
puts foo       # Prints #<Foo:27139....>
puts "Foo is #{foo}"  # Prints foo is #<Foo:27139....>
```
- But if we change 42 to a **string**, it will work properly:
```ruby
class Foo
  def to_s
    "42"
  end
end

foo = Foo.new
puts foo              # Prints 42
puts "Foo is #{foo}"  # Prints foo is 42
```

## More About Self

- We use `self` when calling setter methods from **within** the class.
- We use `self` to help Ruby to understand the difference between a local variable and calling a setter method.
- We use `self` for class method definitions.
- We can play around with self to see how it works:
```ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{self.name} weighs #{self.weight} and is #{self.height} tall."
  end

  def what_is_self
    self
  end
end
```

- From within the class, when an instance method uses `self`, it references the **calling** object.
- So from within `change_info`, `self.name=` has the same results when calling `sparky.name=` **outside** the class.
- When used **outside** of an instance method, `self` references the class and can be used to define class methods.
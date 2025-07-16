# Introduction to Ruby

## Topics to Cover

- How are Ruby/Rails and JS/Node different?
- How are they similar?
- Blocks in Ruby
- Debugging Tips

## Ruby Info

- Everything in Ruby is an object. Ruby is quite fast when it comes to building up the backend, and it simplifies database interaction. The community for Ruby is also quite helpful.
- But not everything in Ruby is fast. In fact, Ruby is quite slow, and everything is asynchronous.
- A gem in Ruby is like a package in Node. It allows us to use improved syntax or different features.

## Variables & Data Types in Ruby

### Types

- Primitive Variables:
  - Strings
  - Numbers
    - Integer
    - Float
  - Boolean
    - TrueClass
    - FalseClass
  - Nil

- Composite Variables:
  - Arrays/Lists
  - Hashes
  - Classes & Objects


### Naming Variables

- When **naming** variables, Ruby does not use `let`, `var`, or `const`. The type is assigned on naming.
- Here is an example of some variable naming:
```rb
first_name = "Alex" # use snake_case for naming
last_name = "Miller"
age = 25 # An integer is created here
grade = 9.8 # A float number is created here
graduated = true
extra_certificate = nil # This is like null

puts graduated, graduated.class
# This outputs:
# true
# TrueClass
```

- Numbers will not automatically return decimals. We have to specify at least one float if we want a decimal.
```rb
num = 3

puts num / 2 # This will output 1, and is WRONG

puts num / 2.0 # This will output 1.5, and is CORRECT
```

- We can update variables in the following way:
```rb
PI = 3.14
puts PI
PI = 31.4
puts PI
```
- This will warn us, but it will work. As a rule of thumb, capitalize variables that you don't want changed.
- We can alter the types of variables temporarily if need be. We can add `.to_s`(to string) or `.to_i`(to integer) to the end of a variable to alter the value type.

## Arrays in Ruby

- Arrays in Ruby are very similar to JS arrays. Here is an example;
```rb
numbers = [10, 20, 30, 40, 50]

puts numbers
puts "_____"
puts numbers[1]

numbers[3] = 45 # This updates an index

# The append and push methods both work in Ruby
numbers.append 60, 70
numbers.push 80, 90
```

## Conditionals in Ruby

- There are no curly brackets for us to contains a conditional.
- Here is how conditionals look in JS:
```rb
num_one = 50
num_two = 80

if num_one < num_two
  puts "#{num_two} is greater than #{num_one}"
else
  puts "#{num_one} is greater than #{num_two}"
end
```
- The `&&`, `||`, and `!` operators work the same as in JavaScript.
- Instead of `else if`, we use `elsif` in Ruby.
- We close a conditional in Ruby with the `end` keyword.
- To compare, in JS, we would use `===` and `!==`, but in Ruby we use `==` and `!=`.
- The ternary operators are the same as JavaScript.

## Loops in Ruby

- The **while** loop is the same in Ruby and in JavaScript, and looks like this:
```rb
i = 1

while i <= 10
  puts i
  i += 1
end
```

- The **do...while** loop in JavaScript goes once to repeat the code, and depending on the condition, stops or continues. In Ruby it looks like this:
```rb
i = 1
loop do
  puts i
  i += 1
  break if 1 > 5
end
```

- There is no standard c style loop in Ruby, but there is an `each` loop, like this:
```rb
(1..11).each do |number|
  puts number
end
```
- The above loop essentially says that for each number between 1 and 11, print the number.
- We can do the same with pre-defined variables:
```rb
names = ["Alex", "Martha", "Roger", "Julie", "Allan"]

names.each do |name|
  puts name
end
```
- We can also get the indices if we need them:
```rb
names = ["Alex", "Martha", "Roger", "Julie", "Allan"]

names.each_with_index do |name, index|
  puts "#{name} - #{index}"
end
```

## ~~Functions~~ Methods in Ruby

- To use methods in Ruby, we need the `def` syntax.
```rb
def add_two_numbers num1, num2
  num1 + num2
end

puts add_two_numbers 10, 20
```
- We don't need to use the `return` syntax seen in JS.
- We don't use the brackets commonly seen in JS.

## Hashes in Ruby

- Hashes are the most similar structure Ruby has when likened to JavaScript objects.
- Here is how hashes are defined and used in a basic sense:
```rb
# The keys HAVE to be strings
student_one = {
  "first_name" => "Alex",
  "last_name" => "Miller",
  "age" => 25
}

# We can print a specific value if we give the key:
puts student_one
puts student_one["first_name"] # Prints: Alex

# This does the exact same as the above code:
puts student_one
puts student_one[:first_name] # Prints: Alex

# We can change the value for a key:
student_one["first_name"] = "Alexander"
puts student_one["first_name"] # Prints: Alexander
```

## Blocks in Ruby

- Blocks in Ruby are **similar** to callbacks in JavaScript.
- In JS, a function with a callback looks like this:
```js
const greeting = (name, callback) => {
  callback();
  console.log(name);
  console.log("See you around!");
};

const printHello = () => {
  console.log("Hello there!");
};

greeting("Alex", printHello);
```

- In a **block** in Ruby, this same code would look something like this:
```rb
# Define the method
def greeting name
  yield
  puts name
  puts "See you around!"
end

# Define the block
def printHello
  puts "Hello there!"
end

# Call the method and give it the block
greeting "Alex" do
  printHello
end
```
- The `yield` in a Ruby function lets the method know to wait for the callback, or **yield** to it.
- Above, we define the method and the block, and then call the method giving it `printHello` as a block.

## Classes and Objects in Ruby

- The syntax in JavaScript using `new` is close to the syntax of Ruby.
- In Ruby, **everything** defined with a class needs to and uses dot notation.
- This is an example of using a class in Ruby:
```rb
class Book
  # Define the attributes
  # We only use the following line of code if we don't need or want getters and setters:
  # attr_accessor :title, :authors, :genre

  # We need the Constructor
  # Use the @ symbol to define the constructor variables
  def initialize title, authors, genre
    @title = title
    @authors = authors
    @genre = genre
  end

  # Methods
  def print_book_info
    puts "Title: #{@title}"
    puts "Authors: #{@authors}"
    puts "Genre: #{@genre}"
  end

  # Getters and Setters
  def get_title
    @title
  end

  def set_title new_title
    @title = new_title
  end
end

# The .new keyword lets ruby know we are triggering the class.
book_one = Book.new "Book A", ["Author 1", "Author 2"], "Fiction"

puts book_one # This just shows some RAM info, but nothing valuable.

puts book_one.title # This triggers an error, because by default 
# attributes are ONLY accessible inside the constructor or class methods.

puts book_one.get_title # We need to use our "getter"

book_one.set_title "Book Title Revised" # We use our setter here
puts book_one.get_title # We see our new title

book_one.print_book_info
```
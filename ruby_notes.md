# Ruby Notes

## The IRB

- The Interactive Ruby Shell is a command line interface where ruby code can be executed.
- **irb** is Ruby's command line REPL, like how **node** is JavaScript's.
- REPL's work roughly the same way. A user is prompted to input something, and after the user hits enter, the REPL evaluates the answer and prints out what the expression evaluates to.
- The irb is essentially a ruby sandbox.

## Ruby Blocks

- If arguments are how we pass data into methods, then blocks are how we pass in behavior.
- A block is a chunk of logic that the method can run.
- Blocks can be passed into methods almost like an invisible argument.
```rb
def print_result
  result_from_block = yield
  puts result_from_block
end

# This will print 9 to the console:
print result { 3 * 3 }
```
- The call to `yield` is where the block is executed.
- `print_result` could also be used in the following ways:
```rb
# Blocks can be written using the do...end format

print_result do
  creature = "Griffin"
  "I am the #{creature}!"
end
```

- Blocks can also use variables outside of their definition:
```rb
shopping_list = [:milk, :eggs, :cheese]
print_result do
# Select one at random
  important_item = shopping_list.sample
  "I hope I don't forget #{important_item}!"
end
```

- Another way to accept a block as an argument in a function is to be more explicit when defining the arguments:
```rb
def print_results(&block)
  result_from_block = block.call
  puts result_from_block
end
```

- Essentially, passing a block into a Ruby method is like passing a callback in a JavaScript function.
- To see more on blocks, refer to the [benchmark_blocks](/benchmark_blocks) folder.

## Ruby Constants

- A *constant* refers to a module.
- Any keyword with a capitalized first letter in considered a constant.
- Both module and class constants create a **namespace** within which other constants can be placed.
- Required files in Ruby have the ability to and are expected to define constants in the global namespace.
- The `::` syntax is used to access constants.
- All constants exist int he object namespace.
# Names, Variables, and Functions

# This one is like the scripts with ARGV
def print_two (*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# That args is pointless, we can just do this:
def print_two_again (arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# This one just takes one argument:
def print_one (arg1)
  puts "arg1: #{arg1}"
end

# This one takes no arguments:
def print_none ()
  puts "I got nothing."
end

print_two("Zed", "Shaw")
print_two_again("Zed", "Shaw")
print_one("First!")
print_none()
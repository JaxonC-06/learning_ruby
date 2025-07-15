# Loops and Arrays

the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# This first kind of for loop goes through a list
# in a more traditional style found in other languages.
for number in the_count
  puts "This is count #{number}"
end

# Same as the above, but in a Ruby style
# which along with the next way is preferred.
fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

# Also we can go through mixed lists
# using an alternate syntax.
change.each {|i| puts "I got #{i}" }

# We can also build lists from scratch:
elements = []

# Then use the range operator to do 0 to 5 counts:
(0..5).each do |i|
  puts "adding #{i} to the list."
  # Push i to the end of the list
  elements.push(i)
end

# Now we can print them too!
elements.each {|i| puts "Element was: #{i}" }
# Booleans

true && true # This is true
false && true # This is false

1 == 1 && 2 == 1 # This is false
"test" == "test" # This is true

1 == 1 || 2 != 1 # This is true
true && 1 == 1 # This is true

false && 0 != 0 # This is false
true || 1 == 1 # This is true

"test" == "testing" # This is false
1 != 0 && 2 == 1 # This is false

"test" != "testing" # This is true
"test" == 1 # This is false

!(true && false) # This is true
!(1 == 1 && 0 != 1) # This is false

!(10 == 1 || 1000 == 1000) # This is false
!(1 != 10 || 3 == 4) # This is false

!("testing" == "testing" && "Zed" == "Cool Guy") # This is true
1 == 1 && (!("testing" == 1 || 1 == 0)) # This is true

"chunky" == "bacon" && (!(3 == 4 || 3 == 3)) # This is false
3 == 3 && (!("testing" == "testing" || "Ruby" == "Fun")) # This is false
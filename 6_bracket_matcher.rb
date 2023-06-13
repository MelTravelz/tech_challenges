################ Instructions ################ 

# Create a method/function that will intake a set of brackets [ { ( as a string 
# and determine if the brackets are well-formed (match). Brackets can be nested.

# Examples:
# bracket('{}')
# => true

# bracket(']')
# => false

################ Clarification Questions ################ 

# 1. Do we need to consider invalid characters? (alphabet, numbers, etc.?)
# 2. Does spacing matter?
# 3. To confirm we are returning a boolean: true or false? 

################ Match ################ 
# This does remind me of palendromes a little bit, to compare two strings
# there is a method that removes all extra space
# we can use .even? to check if the string is even
# need to find a method that will split an even string in the middle?? <- will need to research

################ Pseudocode ################ 
# First need remove all extra space 
# Then check if string is even, if not return -> false 
# if yes -> divide the string in half
# then compare the two halves are = and return -> true

################ First Attempt ################ 


p bracket('( {  []})')
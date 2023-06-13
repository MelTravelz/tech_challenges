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
# 4. Can I add a ? to the method name? (these types of methods will return true or false)

################ Match ################ 
# This does remind me of palendromes a little bit, to compare two strings
# there is a method that removes all white space -> .delete(' ')
# we can use .even? to check if the string is even
# need to find a method that will split an even string in the middle?? <- will need to research
# also need to find a way to match the opposite bracket [ = ]

################ Pseudocode ################ 
# First need remove all white space 
# Then check if string is even, if not return -> false 
# if yes -> divide the string in half
# then compare the two halves are = and return -> true

################ First Attempt ################ 

def bracket(string)
  compact_string = string.delete(' ')
  length_count = compact_string.size

  if length_count.even?
    require 'pry'; binding.pry
    string_array = [compact_string[0, length_count/2], compact_string[length_count/2..-1]]
    string_array[0] == string_array[1] # This would work if we were working with palendromes
  else 
    return "false"
  end
end




p bracket('( {  []})') #happy path

p bracket('({})') #happy path

p bracket('( []})') #sad path

p bracket('(a[]})') #sad path
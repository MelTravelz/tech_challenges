#template: 
################ Instructions ################ 
# Your goal is to write a method/function that converts an integer into a string such that the number is represented in Roman Numerals in the most efficient way.
# For example, the number 4 could be written as IIII but it’s more efficient to use IV since that’s a shorter string.
# Assume no number is greater than 4,000.

# Here are the Roman Numeral equivalents you’ll need to know:

# M=1000
# CM=900
# D=500
# CD=400
# C=100
# XC=90
# L=50
# XL=40
# X=10
# IX=9
# V=5
# IV=4
# I=1

# Example solution: 
# to_roman(128)
# => "CXXVIII"

################ Clarification Questions ################ 
# 1. confirm: the input is an integer or might it occationally be a float, in which case round up or down?
# 2. confirm: the return is a single string with Roman Numberal Characters
# 3. what should be returned is a number is 0 or over 4000? #=> a string with instructions: "Please enter a number between 1 and 4,000"
# 4. would it be ok to search google during work

################ Match ################ 
# I've created/used a dictionary in a project (Nigh Writer) before, it was in a hash structure.

################ Pseudocode ################ 
# Looks like we'll need a dictionary of sorts, so we'll build a hash with our romans and number equivalents. 
# we'll check if the incoming integer is between 1 and 4000, if not return the instruction string
# then, we'll iterate through the dictionary hash & pry in
# i'm thinking we'll need to do some type of substraction to whittle away at the original integer...but we'll see.

# Ok, no that I'm in the method, it looks like we'll need a loop so the number can be subtracted each time until it's zero

################ First Attempt ################ 

ROMANS = {
  "M" => 1000,
  "CM" => 900,
  "D" => 500,
  "CD" => 400,
  "C" => 100,
  "XC" => 90,
  "L" => 50,
  "XL" => 40,
  "X" => 10,
  "IX" => 9,
  "V" => 5,
  "IV" => 4,
  "I" => 1
}

def to_roman(num)
  roman_numeral = ""

  ROMANS.each do |roman, value|
    while num >= value
      roman_numeral += roman
      num -= value
    end
  end

  p roman_numeral
end




to_roman(55)
#=> expecting "LV"

to_roman(54)
#=> expecting "LIV"

################ Alternative Solutions ################ 

#extra: 
################ Additional Resources ################ 

############## Sad Path Brainstorming ##############

############## Final Questions ##############
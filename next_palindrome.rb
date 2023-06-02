############# Instructions
# A palindrome is any number, word, or phrase that reads the same forward as it does backward. 
# In this challenge, we are going to focus on palindromic numbers. For example, 12321 is a palindromic 
# number, whereas 123 is not.

# Your goal is to write a method/function that takes in an integer and returns the next palindrome. 
# It is safe to assume you are working with only whole numbers, no decimals, and no negatives.

############# Example
# find_next_palindrome(100)
# => 101

# find_next_palindrome(101)
# => 111

############# Clarifying Questions
# 1. confirm return is a single integer
# 2. would it be ok to search google during work

############# Match
# .to_s  .reverse .to_i
# counter += 1

############# Pseudocode
# start with an integer
# loop? while / until / loop
# have a counter that adds 1
# change to string, reverse -> check if number == reverse_number 
# when it finds palindrome .to_i 
# might need to use explicit return? / break

############# First Attempt: 
def find_next_palindrome(num)
  while true do
    next_number = num + 1
    # next_num = next_number.to_s
    # reverse_next_num = next_num.reverse
    if next_num.to_s.reverse == next_number.to_s
      return next_number 
    else
      num = next_number
      false 
    end
  end
end


result_1 = find_next_palindrome(100)
p result_1

result_2 = find_next_palindrome(122)
p result_2


############# Refactored Solution: 
def next_palindrome(number)
  number + 1
  until number.to_s == number.to_s.reverse
    number += 1
  end
  return number
end

p next_palindrome(122)

############# Second Refactored Solution: 
# def next_palindrome(number)
#   number += 1
#   while !palindrome?(number)
#     number += 1
#   end
#   return number
# end

# def palindrome?(number)
#   number.to_s == number.to_s.reverse
# end
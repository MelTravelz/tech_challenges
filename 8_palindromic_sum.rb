################ Instructions ################ 
# A palindrome is any number, word, or phrase that reads the same forward as it does backward. 
# In this challenge, we are going to focus on palindromic numbers. For example, 12321 is a palindromic 
# number, whereas 123 is not.

# Write a method/function that starts at 0 and finds the first twenty-five numbers where 
# the number plus its inverse equals a palindrome that is greater than 1,000.

# 47(number) + 74(inverse) = 121(palindrome) Note: This does not meet the greater than 1,000 rule.

# Collect the twenty-five numbers in an array as the return value. 
# Be sure to collect the number and not the sum.

#Bonus: Once you’ve found a working solution, see if you can create a solution without converting 
# the numbers to strings/arrays.


################ Clarification Questions ################ 
# 1. Ok, so we've got a function that will start at 0 and count up until:
  # - the number + it's inverse equal a palindrome
  # - AND that sum/palindrome is larger than 1000
  # - Then, we return an array of 25 elements which are the numbers where all of the above is true.
# 2. Would using a counter or range be preferred? 
# 3. Should the method take in an argument or do we always want it to just start at zero?
# 4. And, we are assuming all numbers will be integers/whole, positive numbers, correct? 

################ Match ################ 
# This is definitely similar to other palindrome code I've worked on, but not with integers before
# often I've used .reverse on strings
# I'm wondering if we can use recursion here too...we'll see

################ Pseudocode ################ 
# Assumption: method will not take in an argument but will automatically start at zero
# Assumption: all numbers will be only whole, positive integers

# we'll need to look at each element
# change to a string, reverse it, sum it up 
# then ensure that sum is greater than 1000
# then return the original number in a new array

################ First Attempt ################ 

def find_25_palind_nums
  results_array = []
  counter = 0

  while results_array.length < 25
    sum = counter + counter.to_s.reverse.to_i
    if sum > 1000 && sum == sum.to_s.reverse.to_i
      results_array.push(counter)
    end
    counter += 1
  end

  results_array
end

p find_25_palind_nums

################ Alternative Solutions ################ 

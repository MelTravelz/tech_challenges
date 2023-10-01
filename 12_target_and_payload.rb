################ Instructions ################ 
# Write a method that takes two parameters, payload and target. 
# The playload should be an array of unique integer values(positive, negative, or 0). 
# The target should be an integer(positive, negative, or 0).
# Your method/function should search through the payload to find any two numbers that add together to equal the target value.

# When you find a pair of numbers that add up to your target value, 
# you can stop processing/searching and return an array of those two values. 
# If no values are found return an empty array.

# Be careful that you don’t find the same number twice in your payload; 
# for example if your payload contains a 4 and your target is 8, your answer should not indicate that it found 4 twice.

# Example:
# find_target([1, 3, 4, 5, 10], 15)
# => [5, 10]
# find_target([-1, -3, 4, 7, -5, 18, 10, -23, 5], 15)
# => [-3, 18]
# find_target([-3, -34, 2, 6, 40, -4], 1)
# => []

# Bonus: Once you’ve found a working solution, try to optimize to run in O(n) time and 1x space complexity.


################ Clarification Questions ################ 
# For clarification: 
# The two arguments are 1)payload = an array of unique integers & 2)target = an integer
# And the retun will be the FIRST two numbers who's sum equals the target, if none is found return an empty array

# 1. So we assuming the payload array will ALWAYS have unique integers inside? (could add .uniq to ensure this in sad/edge case testing)
# 2. Will the payload array be sorted asc/desc order and is their order important? (if not, I can use .sort if necessary)

################ Match ################ 
# this reminds me of a challenge I had where we needed to double iterate, to find the first number and compare it to and iteration of the rest of the numbers
# I also seem to remember .combination will compare each uniqe number in a set... possibly use this? 

################ Pseudocode ################ 
# first, we'll sort the payload
# then I want to try .combination(2) and see if this works if not, then we'll double iterate
  # ok it looks like .combination worked by creating unique pairs of all the numbers in the original array!
# then we sum each of those inner arrays and if == target we'll return that array
  # changed .each to .find since that enumerable returns the block variable


################ First Attempt ################ 

def find_target(payload, target)
  target_match = payload.sort.combination(2).to_a.find do |payload_pair|
   payload_pair.sum == target
  end
  p target_match || []
end



find_target([1, 3, 4, 5, 10], 15)
#=> expecting [5, 10]

# now, what if there is no match! => it returns nil, but we want an empty array
find_target([-3, -34, 2, 6, 40, -4], 1)
# => []

################ Alternative Solutions ################ 


#extra: 
################ Additional Resources ################ 

############## Sad Path Brainstorming ##############

############## Final Questions ##############
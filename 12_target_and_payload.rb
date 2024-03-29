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

# 1. So we are assuming the payload array will ALWAYS have unique integers inside? (could add .uniq to ensure this in sad/edge case testing)
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
    # start_time = Time.now

def find_target(payload, target)
  target_match = payload.sort.uniq.combination(2).to_a.find do |payload_pair|
   payload_pair.sum == target
  end
  p target_match || []
end

    # end_time = Time.now
    # p end_time - start_time
    #=> 1.0e-06, 2.0e-06, 2.0e-06, 2.0e-06  (This one appears to be slower most of the time)

find_target([1, 3, 4, 5, 10], 15)
#=> [5, 10]

find_target([-1, -3, 4, 7, -5, 18, 10, -23, 5], 15)
# => [-3, 18]

# now, what if there is no match! => it returns nil, but we want an empty array
find_target([-3, -34, 2, 6, 40, -4], 1)
# => []

# what if there is a duplicate integer in the payload array? => added .uniq just in case!
find_target([5, 1, 3, 4, 5, 8], 10)
#=> expecting []

# edge case, what if invalid element is passed into payload?
# for this we'd need to possibly add another iteration of the payload_pair and convert all elements .to_i
# => for the scope of this tech challenge I don't think it's necessary
# find_target([1, 3, "4", 5, 10], 15)
#=> expecting [5, 10]

################ Refactored Code ################ 
    # start_time = Time.now

def find_target_refactored(payload, target)
  target_match = payload.combination(2).to_a.find do |payload_pair|
   payload_pair.sum == target
  end
  p target_match || []
end

    # end_time = Time.now
    # p end_time - start_time
    #=> 2.0e-06, 1.0e-06, 1.0e-06, 1.0e-06 (this one seems to occationally be faster most of the time)

# using only the three example returns, let's see if we can make this code more efficient
# 1st, we don't actually need .sort or .uniq

find_target_refactored([1, 3, 4, 5, 10], 15)
#=> [5, 10]

find_target_refactored([-1, -3, 4, 7, -5, 18, 10, -23, 5], 15)
# => [-3, 18]

find_target_refactored([-3, -34, 2, 6, 40, -4], 1)
# => []
 
################ Alternative Solution from ChatGPT ################ 

    # start_time = Time.now

def find_target_fast(payload, target)
  seen_hash = {} #accumulator
  
  payload.each do |num|
    complement = target - num #so instead of making an array of arrays, we subtract the num from the target which is called complement
    
    if seen_hash[complement] #if we find the compliment number we are looking for in they keys of our seen_hash, it enters this if conditional
      p [complement, num] #Then we create the array we want returned
      return [complement, num]
    end

    seen_hash[num] = true #this makes each number we iterate through a key in our seen_hash. (If the compliement returns "true" then it passes into the if conditional!! BRILLIANT!!)
  end

  p [] #if no match is found it'll return an empty array
end

    # end_time = Time.now
    # p end_time - start_time
    #=> 1.0e-06, 1.0e-06, 1.0e-06, 1.0e-06 ( This one is the most consistent & fastest )

find_target_fast([5, 3, 4, 1, 10], 15)
#=> expecting [5, 10]

find_target_fast([1, 3, 4, 5, 10], 15)
#=> expecting [5, 10]

find_target_fast([-1, -3, 4, 7, -5, 18, 10, -23, 5], 15)
# => [-3, 18]

find_target_fast([-3, -34, 2, 6, 40, -4], 1)
# => []

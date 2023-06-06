################ Instructions ################ 
# You are given three arrays of equal size. Each array has 1 million RANDOM integer values.

# Assume that each array is already sorted in ascending order and that no individual array has any duplicate values.

# Your goal is to write a method/function that will return an array of any/all values which are present in all three arrays.

# Bonus: Once you’ve found a working solution, try to optimize to run in O(n) time and 1x space complexity.

# Example: 
#    nums_1 = [1, 2, 4, 5, 8]
#    nums_2 = [2, 3, 5, 7, 9]
#    nums_3 = [1, 2, 5, 8, 9]
#    find_matches(nums_1, nums_2, nums_3)
#    => [2, 5]


################ Clarification Questions ################ 
# 1. May I work with a smaller array of numbers, say one with 5 elements? 
# 2. The return is an array of numbers that are in alll three arrays, correct? 
# 3. Shall I return an empty array or something else (string-sentence, false, etc.) if there are not matches? 
# 4. May I use the internet to search for specific enumerables? 


################ Pseudocode ################ 
# From the example I see we'll be making a single method that accepts three arguments and those arguments are the array of numbers. 
# my first idea is to possibly join all the arrays and then identify the numbers that are triplicates and return just one of those. 
 # we could join them with nums_1.concat(nums_2) and then .sort again so it's all in order. Ok, and what if we use .count to see how many of each number there is we could use .find_all or .select to return those numbers. Then we'd need a .uniq to return only one.
 # Here's something found on the internet using this idea: https://stackoverflow.com/questions/30336581/ruby-find-duplicates-in-an-array

# (I'm concerned that if we iterate over all three arrays, and there could be millions of number, it would just take absolutely forever.)


################ First Attempt ################ 
nums_1 = [1, 2, 4, 5, 8, 9, 11, 14, 55]
nums_2 = [2, 3, 5, 7, 9, 10, 13, 14, 56]
nums_3 = [1, 2, 5, 8, 9, 11, 14, 51]

def find_matches(nums_1, nums_2, nums_3)
  array_nums = nums_1.concat(nums_2).concat(nums_3).sort
  triples = array_nums.select do |num|
    array_nums.count(num) > 2
  end.uniq
end

array_of_triples = find_matches(nums_1, nums_2, nums_3)
p array_of_triples
# => [2, 5, 9, 14]


############## Next Steps Brainstorming ##############
# the next step would be to try it with a larger array of numbers
# nums_1 = (1..1000).to_a.sample(100)
# nums_2 = (1..1000).to_a.sample(100)
# nums_3 = (1..1000).to_a.sample(100)

# I'd also add a sad path for when there are no matches


################ Alternative Solutions ################ 
# def find_matches(nums_1, nums_2, nums_3)
#  nums_1.select do |num|
#    nums_2.include?(num) && nums_3.include?(num)
#  end
#end
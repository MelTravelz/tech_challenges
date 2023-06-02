################ Instructions ################ 
# In this challenge you are given an array of unique integers. 
# Your job is to return all the possible combinations of unique pairs (2 integers only). 
# No duplicate pairs are allowed. Below are some examples:

# Example 1
# Input: [1, 2, 3, 4]
# Output: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]

# Example 2
# Input: [54, 77]
# Output[[54, 77]]

# Example 3
# Input: []
# Output: []

################ Clarification Questions ################ 
# 1. Confirm input/output: input=array output=array or array of arrays
# 2. Is it important that these numbers be ordered in any way (like lowest to highest)?
# 3. Do I need to check for alternative data types? Or will the information always be an integer?
# 4. Am I allowed to look at the documentation or google to search for correct enumerables/information? 

################ Match ################ 
# We will need to iterate 
# Index position is important

################ Pseudocode ################ 
# we're creating a method that will take a single argument which is an array
# must iterate over that incoming array
# take first index position & add another number and create a new array
# continue until the end of the outter array
# move to next index position and continue process
# there might be an enumerable that does this - I'll need to research (.each_cons)

################ First Attempt ################ 
# def subset_numbers(input_array)
#   output_array = []

#   while input_array != []
#     input_array.each_cons(2) do |a| 
#       output_array << a 
#     end
#     input_array.shift
#   end

#   output_array
# end

# input_1 = [1, 2, 3, 4]
# p subset_numbers(input_1)
# # => [[1, 2], [2, 3], [3, 4], [2, 3], [3, 4], [3, 4]]

# maybe .each_with_index ??

################ Second Attempt ################ 
def other_subset_numbers(input_array)
  input_array.combination(2).to_a
end

input_4 = [1, 2, 3, 4]
p other_subset_numbers(input_4)
# => [[1, 2], [2, 3], [3, 4], [2, 3], [3, 4], [3, 4]]
# More on .combination method: https://ruby-doc.org/core-2.4.1/Array.html#method-i-combination

input_2 = [54, 77]
p other_subset_numbers(input_2)
# => [[54, 77]]

input_3 = []
p other_subset_numbers(input_3)
# => []
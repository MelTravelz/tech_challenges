################ Instructions ################ 
# Given an n x n array, write a method that returns the array elements arranged from outermost 
# elements to the middle element, traveling clockwise.

# A good way to visualize this is to picture the spiral shell of a snail!

# Example:
# array_matrix = [
#  [1, 2, 3],
#  [4, 5, 6],
#  [7, 8, 9]
# ]

# snail(array_matrix) 
#    => [1, 2, 3, 6, 9, 8, 7, 4, 5]


################ Clarification Questions ################ 
# 1. Inside the outter array, will there always be only 3 arrays or multiple?
# =>  yes
# 2. Inside the inner arrays, will there always be only 3 elements? 
# => yes
# 3. Will the length of the inner arrays be consistent/same? 
# => same length

# While I was coding, I asked: 
# 4. Do you mind if I pop onto Google and pull of the documentation to check on this method? 
# 5. Do you know of an enumerable that would remove each of the inner arrays? 
# 6. Do you see anything I may have missed, or do you have any other ideas for sad path/edge case tests? 


################ Pseudocode ################ 
# return the entirity of the first array
# return the last element in the second array
# return in reverse order, the entirity of the last array
# return what is left of the second array 


################ First Attempt ################ 
array_matrix = [
 [1, 2, 3],
 [4, 5, 6],
 [7, 8, 9]
]

def snail(array_matrix)
  array1 = array_matrix.shift
  array2 = array_matrix.shift
  array3 = array_matrix.shift

  last_index_num = array2.pop

  array1.concat([last_index_num]).concat(array3.reverse).concat(array2)
end

final_array = snail(array_matrix) 
p final_array
# => [1, 2, 3, 6, 9, 8, 7, 4, 5]
# More info on .shift/.unshift & .push/.pop: https://dev.to/ddhogan/quick-reference-for-array-methods-pushpop-vs-shiftunshift-4g7h
#                             beginning	  end
# adding, returns array	  ->  .unshift	  .push
# returns removed element	->  .shift	    .pop


############## Sad Path Brainstorming ##############
# if the array lengths or number of arrays change, the code would need to be refactored
# if another data type were one of the elements we could check for this with a helper method before the code runs
# I would aim to refactor the method used to pull out each array, which would require a bit of research

############## Final Questions ##############
# Is there anything you can see off the top of your head that would improve the current code? 
# Do you see anything that I might have missed? 
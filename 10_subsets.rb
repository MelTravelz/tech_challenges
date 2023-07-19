################ Instructions ################ 
#In this challenge you are given an array of unique integers. 
#Your job is to return all the possible combinations of unique pairs 
#(2 integers only). No duplicate pairs are allowed.

#Examples: 
# Input: [1, 2, 3, 4]
# Output: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]

# Input: [54, 77]
# Output[[54, 77]]

# Input: []
# Output: []


################ Clarification Questions ################ 
# Can I research online for the method that I think we can use? 

################ Match ################ 
#I've worked on something just like this before and I remember there is a specific method we can use.

################ Pseudocode ################ 
#We'll find that method online
#Pass in an argument of how many elements we want it to combine
#And put those combos in an array (.to_a)

################ First Attempt ################ 

def find_pairs(arr)
  arr.combination(2).to_a
end

array_1 = [1, 2, 3, 4]
array_2 = [54, 77]
array_3 = []

p find_pairs(array_1)
#=> [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]

p find_pairs(array_2)
#=> [[54, 77]]

p find_pairs(array_3)
#=> []


################ Possible Extension ################ 
#If you successfully complete the challenge above, 
#consider refactoring your solution to return all possible unique subsets 
#from the original array. A subset is any selection of the array, and can be 
#between 0 and n elements long, where n is the number of items in the original array.

#Example: 
# Input: [1, 2, 3, 4]
# Output: [[],[1],[2],[3],[4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4],[1,2,3],[1,2,4],[1,3,4],[2,3,4],[1,2,3,4]]
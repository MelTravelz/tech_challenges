################ Instructions ################ 
# In Ruby, there is a built in method/function to flatten arrays, 
# meaning it makes them one-dimensional: 

# nums = [1, 2, 3, [[4], 5], [[[6]]]]
# nums.flatten
#=> [1, 2, 3, 4, 5, 6]

# Your goal is to recreate this functionality without using the built in method/function. 
# You will be given a deeply nested array, or multi-dimensional array, 
# that will look similar to the examples below:

# nums = [1, 2, 3, [[4], 5], [[[6]]]]
# words = ["hi", "this is", [[["string"], "that is very"], [[[["nested"]]]]]]

# The contents of the array is not significant. Your method/function should take an input 
# of a multi-dimensional array and output a one-dimensional array. 
# More simply put, remove the deeply nested brackets to return a single array.

################ Clarification Questions ################ 
# 1. So the content/elements are not significant and we want to return an array of those elements.

################ Match ################ 
# This exercise reminds me to the enumerables Ruby exercieses from Turing

################ Pseudocode ################ 
# I'm thinking .delete([]) might work
# maybe we need to make everything inside the outter array an element and then delete
# ok looks like a nested array might be necessary
# and we might possibly use recursion to loop through n number of times?

################ First Attempt ################ 

def flatten_array(array)
  results = []

  array.each do |element|
    if element.class == Array
      element.each do |number|
        results.push(number)
      end
    else
      results.push(element)
    end
  end

  results
end

nums = [1, 2, 3, [[4], 5], [[[6]]]]
# words = ["hi", "this is", [[["string"], "that is very"], [[[["nested"]]]]]]

p flatten_array(nums)

################ Alternative Solutions ################ 
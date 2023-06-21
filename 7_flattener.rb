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
# 2. Might I use the internet to research recursion and how I might implement it here? 


################ Match ################ 
# This exercise reminds me to the enumerables Ruby exercieses from Turing (each vs. other enumerable)


################ Pseudocode ################ 
# I was hoping we could just convert the inner arrays: 
# I'm thinking .delete([]) might work
# maybe we need to make everything inside the outter array an element and then delete

# However, it appears iteration will be necessary"
# ok looks like a nested iteration might be necessary
# and we might possibly use recursion to loop through n number of times?


################ First Attempt ################ 

def flatten_array(array, results = []) # add options argument results so it can be carried each iteration

  array.each do |element| # we iterate through each element
    if element.class == Array # we check to see the class type
     flatten_array(element, results) # if the class type is an array, with recursion: send it through this method again
    else
      results.push(element) # once the class type is not Array, put the element into results
    end
  end

  results # return the final results array
end

nums = [1, 2, 3, [[4], 5], [[[6]]]]
words = ["hi", "this is", [[["string"], "that is very"], [[[["nested"]]]]]]

p flatten_array(nums)
p flatten_array(words)


################ Alternative Solutions ################ 
# def flatten_array(arr) 
#   flattened = [] #leaves return array inside method rather than making optional argument

#   arr.each do |element|
#     if element.is_a?(Array) # uses diff syntax to check class of element
#       flattened += flatten_array(element) # also uses recursion
#     else
#       flattened << element # uses shovel operator insted of .push
#     end
#   end

#   flattened
# end

# nums = [1, 2, 3, [[4], 5], [[[6]]]]
# words = ["hi", "this is", [[["string"], "that is very"], [[[["nested"]]]]]]

# p flatten_array(nums)
# p flatten_array(words)

################ 

def flatten_array(arr)
  result = []
  stack = [arr]  # Use a stack(data structure) to keep track of nested arrays

  until stack.empty? # starts a loop that continues until the stack is empty
    current = stack.shift # removes first element from the stack

    if current.is_a?(Array) 
      current.each do |element| 
        stack.push(element) # push each element of the current array onto the stack
      end
    else
      result.push(current) # or returns the element if it's not an array
    end
  end

  result 
end

nums = [1, 2, 3, [[4], 5], [[[6]]]]
words = ["hi", "this is", [[["string"], "that is very"], [[[["nested"]]]]]]

p flatten_array(nums)
p flatten_array(words)
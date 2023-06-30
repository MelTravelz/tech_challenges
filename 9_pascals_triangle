################ Instructions ################ 
# What's Pascal's triangle? https://en.wikipedia.org/wiki/Pascal's_triangle
# (add the two numbers to the top R and L of a space to provide it's value)
# Example: 

#        1
#       1 1
#      1 2 1
#    1  3 3  1
#  1  4  6  4  1

# Your goal is to write a method/function that, given a depth (n),
# returns an array representing Pascal’s Triangle to the n-th level.


################ Clarification Questions ################ 
#1. How many "rows" of the triangle do we want returned? Should that be sent as an argument? 
#2. In what order is the returned array, each row from L to R, top to bottom from L to R, an array of arrays?
#3. Do we want only the final line to be returned or all of the elements?
#4. May I do some research online to help build out this method? 

################ Match ################ 
# I've not done anything like this before - very exciting!
# I know binary trees are in the shape of a triangle, so I'm wondering if these are related?
# I suppose this could also be seen like a palindrome since the two ends of the array will be reversed of each other?
#  -> and for odd lengths there would just be a unique number in the middle 


################ Pseudocode ################ 
# Ok, first I'd say let's accept an argument of the row number that tells the code how many lines to calculate
# this will also give us the length of the array (and if it'll be odd or even number of elements)

# We need to decide how the array elements are structured:
# let's say they will be returned as an array of arrays
# So it'll look something like this: [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]] ...and so on

# Now, let's notice: 
# each inner array begings and ends with 1
# if nil we'll need to make that equal 0 ?? so each array begins with 1??
# then we add each element next to the other and put between the 1's that are in each inner array? if so, then we really start at array 2

# it also seems like we'll be looping as we do this...so possibly use recursion? 

################ First Attempt ################ 

def pascals_array(row_number)
  pascal = [[1]] # hard code the first element in the pascal array
  row = [1, 1] # hard code the first row

  (1...row_number).each do |num|
    next_row_arrays = ([0] + row).zip(row + [0])
    # .zip = takes one element and merges the corresponding element from each argument into one array:
    # [0] + row => [0, 1, 1]
    # row + [0] => [1, 1, 0]
    #returns => [[0, 1], [1, 1], [1, 0]] 

    row = next_row_arrays.collect do |a, b| 
      a + b 
    end
    # .collect = looks at each inner row and adds the two elements, then merges them all together: 
    #returns => [1, 2, 1]

    pascal.push(row)
  end

  pascal
end


p pascals_array(5)
#=> [[1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1], [1, 5, 10, 10, 5, 1]]


################ Alternative Solutions ################ 
def pascals_triangle(n)
  triangle = []

  (0...n).each do |row|
    # this makes a new, empty, inner array element
    triangle[row] = []
    # this sets the first element in the inner array to 1
    triangle[row][0] = 1
    # this sets the last element in the inner array to 1
    triangle[row][row] = 1

    # This is is looking at the row before it: [row - 1] 
    # and adding the previous element to the current element: [col - 1] + [col]
    (1...row).each do |col|
      triangle[row][col] = triangle[row - 1][col - 1] + triangle[row - 1][col]
    end
  end

  triangle
end

p pascals_triangle(4)

################

# Here is an example that I glance at the build my first attempt
# it does NOT hard code the first two row, but uses an if statement: 

def pascal n
  pascal = []
  row = [1]

  (0...n).each do |i|
    # only for the first iteration sets pascal equal to [[1]] and row to [1,1]
    if i.zero?
      pascal << row
    else
      row = ([0] + row).zip(row + [0]).collect { |a, b| a + b }
      pascal << row
    end
  end

  pascal
end 

p pascal(5)
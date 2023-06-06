################ Class Work 1 ################
# def countdown(num)
#   # check our base case, if statement
#   if num < 0
#     return(num)
#   end
#   p num 
#   # recursive case moving towards base case
#   countdown(num - 1) 
# end

# p countdown(5)
# => 5 4 3 2 1 0 nil
# how to remove nil? 
# added return(num) => 5 4 3 2 1 0 -1

################# how to remove -1? 
def countdown(num)
  if num == 0
    return 0
  end
  p num 
  countdown(num - 1) 
end
 
p countdown(5)
# => 5 4 3 2 1 0

################ Class Work 2 ################
# numbers = [1, 2, 3, 4]
# get_sum(numbers)

# Pseudocode:
# when array is empty, return sum
# remove one element add to zero
# remove next element add to previous sum
# continue until array is empty

def get_sum(array_nums)
  if array_nums == [] #another way to write: array_nums.empty?
    return 0
  else
    return array_nums[0] + get_sum(array_nums[1..-1])
  end
end

numbers = [1, 2, 3, 4]
p get_sum(numbers)
# => 10

################ Exercises from: https://mod4.turing.edu/lessons/cs/recursion.html ################ 
################ Exercise 1 ################
# In mathematics, the factorial of a non-negative integer is the product of 
# all positive integers less than or equal to n. Write a recursive function that calculates the factorial of a number.
# For example, the factorial of 5 is 120.
# 5 x 4 x 3 x 2 x 1 = 120

def factorial(n)
  if n == 0 
    return 1 #cannot return 0 in multiplication!!
  else
    return n * factorial(n -1)
  end
end

n = 3
p factorial(3)
# => 6

################ Exercise 2 ################
# Reverse a string. JavaScript example: 
# let reversedString = reverse('Ariel')
# console.log(reversedString); // leirA

# answer without recursion:
# def reverse(string)
#   # string.reverse
#   array = string.split("")
#   new_array = []
#   (array.length).times do
#     new_array << array.pop
#   end
#   new_array.join
# end

# p reverse("Ariel")
# # => "leirA"

# answer with recursion from ChatGPT:
def reverse2(string)
  if string.length <= 1
    return string
  else
    return reverse2(string[1..]) + string[0]
    # the hard part about this is understanding it when it's not math!?
  end
end

p reverse2("Ariel")


################ Example: https://www.geeksforgeeks.org/recursion-in-ruby/ ################
################ Ruby program for calculating the Nth Fibonacci number.
def Fibonacci(number)
  # Base case :  when N is less than 2.
  if number < 2
    number
  else
    # Recursive call : sum of last two Fibonacci's.
    Fibonacci(number - 1) + Fibonacci(number - 2)
  end
end
  
p Fibonacci(12)
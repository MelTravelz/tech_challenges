################ CURRENTLY NO WORKING SOLUTION FOUND!!! ################ 

################ Instructions ################ 
# In this challenge you are given a menu and a list of receipt values. 
# Write a method/function to find the FIRST combination of food that adds up to the receipt total. 
# Return a print out of only ONE combination for that receipt, and move on to the next receipt. 
# How the print out looks is up to you, but here are some examples:

# Example 1
  # 4.85:
  # 3 items, extra veggies, chips, cheese

# Example 2
  # 13.75:
  # 3 items, {'veggie sandwich': 1, 'nachos': 2}

# Constraints:
#  you must use 100% of the receipt value, we don’t want any money left over
#  you can order any quantity of any menu item
#  none of the receipt values are “tricks”, they all have answers

# Tip: 
#  Doing subtraction and addition on money values CAN lead to “floating point precision” problems. 
#  For example, 4.85 - 1.25 might give you 3.599999996. Round values to two decimal places to make sure you’re finding answers.

################ Clarification Questions ################ 
# 1. I'm thinking to create a method where we pass in the receipts array (sort of like at the end of the work day, checking all receipts). Will this by ok or did you have a different idea? 

# 2. The return sounds optional, I'd like to aim to make a hash like this for each receipt: 
    # { 13.75: {3: ['veggie sandwich', 'nachos', 'nachos']} } -> receipt_total: item_count: [items]
    # ... that being said, our final return will be an array of nested hashes

# 3. So there will not be a sad/edge case test. For now we will set that aside, correct?

################ Match ################ 
# Here again we'll use a dictionary. I'll make that a constant (since the menu won't change much)
# We'll need a nested hash return for each of the receipt items, so we'll need to build out those hashes
# and we can use .find to find the first match

#I'm done something similar but it was only compairing pairs and could not include it's own number... this will be new!

################ Pseudocode ################ 
# Ok, send all receipts and as an argument to the method
# Since we've got two sets, I'm thinking something like .reduce might work? (I'll need to do a bit of research)
# essentially, we need to iterate through each receipt... while in there, we need to find any combination of menu items that equal that total
# so since menu is a hash, we could try subtracting and searching OR adding and comparing (I'm not sure, well see what we can figure out when we get here)
# once we find our combination we can put those keys into an array, .size to get the key and make that the value-hash for our receipt key

# ohhh now I'm wondering if we need to order the menu items by price, and start by adding the largest item that is within the receipt price.
# Ok... this also seems ripe for recrusion since I'm looping
################ First Attempt ################ 

MENU = {
  'veggie sandwich' => 6.85,
  'extra veggies' => 2.20,
  'chicken sandwich' => 7.85,
  'extra chicken' => 3.20,
  'cheese' => 1.25,
  'chips' => 1.40,
  'nachos' => 3.45,
  'soda' => 2.05,
}

def find_menu_items(receipts)
  receipts.map do |receipt_total| #final return in an array so we'll use .map here
    item_names = []
    current_total = 0
    
    MENU.each do |item_name, item_price|
      while current_total + item_price <= receipt_total #changed loop from until to while, this will also allow for it to continue to find multiple of the same item if necessary
        current_total += item_price
        item_names.push(item_name)
      end
    end

      { receipt_total => { item_names.size => item_names } } 
  end
end


receipts = [4.85, 11.05, 13.75, 17.75, 18.25, 19.40, 28.25, 40.30, 75.00]
solution = find_menu_items(receipts)

p solution
#=>expected solution: [{4.85=>{3=>["cheese", "chips", extra veggies"]}}...
#because  1.25 + 1.4 + 2.20 = 4.85

#### This code is NOT correct:
#=>actual return: [{4.85=>{2=>["extra veggies", "extra veggies"]}}...
# this is incorrect: extra veggies = 2.40 x 2 = 4.40 but the receipt should be 4.86


## Will need to come back to this one and think further on it
################ CURRENTLY NO WORKING SOLUTION FOUND!!! ################ 

# Ideas: I'm wondering if I need to use a binary tree or linked lists...two thinks I'm unfamiliar with as of now.
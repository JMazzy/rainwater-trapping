# Given an array of positive integers representing an elevation map, imagine that rain water could be "trapped" by that elevation map.
# Write an algorithm to determine how much rainwater could be trapped!

# Notes:
# See picture for help understanding...
# Assume water "leaks" out the side and is not trapped by the edge
# Columns are 1 unit wide

# Example Input/Output:
# Standard "random" examples
[0,1,0,2,1,0,1,3,2,1,2,1] # => 6
[4,0,2,1,2,1,4]           # => 14
[0,1,2,1,2,3,0]           # => 1
[5,4,3,2,1,2,3,2,1,3]     # => 7

# Special cases
[1,3,5,0,5,3,1]           # => 5 Symmetric - odd
[1,0,2,2,0,1]             # => 2 Symmetric - even
[1,2,3,4,3,2,1]           # => 0 Mountain
[0,1,2,3,4,5]             # => 0 Up slope
[5,4,3,2,1,0]             # => 0 Down slope
[4,3,2,1,2,3,4]           # => 9 Valley
[1,0,1,1,1,0,1,1]         # => 2 Plain

#############################################################

# Another implementation of a solution I found several places online. O(n)

def rain_trap(array)
  left_max, right_max = 0, 0
  left_arr, right_arr, min_arr, result_arr = [], [], [], []

  array.each_index do |idx|
    right_idx = array.size - 1 - idx

    left_max = array[idx] if array[idx] > left_max
    left_arr[idx] = left_max

    right_max = array[right_idx] if array[right_idx] > right_max
    right_arr[right_idx] = right_max
  end

  array.size.times do |num|
    min_arr[num] = [left_arr[num],right_arr[num]].min
  end

  array.size.times do |num|
    result_arr[num] = min_arr[num] - array[num]
  end

  result_arr.inject(0) { |sum,num| sum + num }
end

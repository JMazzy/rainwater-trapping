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

# My solution - O(n)
def rain_trap(array)
  left = 0
  right = array.size - 1
  left_max, right_max, global_max = 0, 0, 0
  right_water, left_water, total_water = 0, 0, 0

  until left == right

    # if reaching a new/tied max
    if array[left] >= left_max
      # set the max
      left_max = array[left]

      # dump accumulated into the total
      total_water += left_water
      left_water = 0

      # set the global max
      if left_max > global_max
        global_max = left_max
      end
    else
      # otherwise add the max - current value
      left_water += left_max - array[left]
    end

    # Do the same on the right
    if array[right] >= right_max
      right_max = array[right]
      total_water += right_water
      right_water = 0
      if right_max > global_max
        global_max = right_max
      end
    else
      right_water += right_max - array[right]
    end

    # Iterate if the max is not the global max
    # second check is to break a "draw" with the right iterator...
    if left_max != global_max || ( right_max == left_max && left_max == global_max )
      left += 1
    end

    # Iterate if the max is not the global max
    if right_max != global_max
      right -= 1
    end
  end

  # final dump of remaining water...
  total_water += left_water + right_water

  total_water
end

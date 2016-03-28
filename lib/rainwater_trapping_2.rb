# Another solution from online. O(n)

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

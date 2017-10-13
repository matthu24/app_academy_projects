#O (n^2)
def my_min_1(arr)
  arr.each_with_index do |el1,idx1|
    min = true
    arr.each_with_index do |el2,idx2|
      next if idx1 == idx2
      if arr[idx1] > arr[idx2]
        min = false

      end

    end
    return el1 if min == true
  end

end

#O (n)
def my_min_2(arr)
  min = arr[0]
  arr.each_with_index do |el,idx|
    min = el if el < min
  end
  return min

end


def largest_continuous_subsum(arr)
  sub_arrays = []
  arr.each_with_index do |el1,idx1|
    (idx1..arr.length-1).each do |idx2|
      sub_arrays << arr[idx1..idx2]
    end
  end
  sum_sub_arrays = sub_arrays.map {|sub_array| sub_array.reduce(:+)}
  sum_sub_arrays.max
end

def largest_continuous_subsum(arr)
  all_positive= arr.all? {|el| el >= 0}
  return arr.reduce(:+) if all_positive

  all_negative = arr.all? {|el| el <= 0}
  return arr.max if all_negative


  current_sum = 0
  largest_sum = 0

  arr.each do |el|
    current_sum += el

    if current_sum < 0
      current_sum = 0
     end

    if current_sum > largest_sum
      largest_sum = current_sum
    end
  end

  largest_sum
end

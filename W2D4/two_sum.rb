def bad_two_sum?(arr,target)

  arr.each_with_index do |el1,idx1|
    (idx1+1..arr.length-1).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  return false

end

#have two indices that can both move, depending on if the target is
#greater or less than the sum of the two
def ok_two_sum?(arr, target)
  first_ind = 0
  last_ind = arr.length - 1

  arr.length.times do
    if arr[first_ind] + arr[last_ind] == target
      return true
    elsif arr[first_ind] + arr[last_ind] > target
      last_ind -= 1
    else
      first_ind += 1
    end
  end

  false
end

#iterate through the array (O(n)) and look up if the hash includes
#its appropriate pair, if not, add the element to the hash and continue iterating
def best_two_sum?(arr, target)
  hash = {}

  arr.each do |el|
    return true if hash[target - el]
    hash[el] = true
  end


  false
end

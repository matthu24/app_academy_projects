def naive_max_window(arr,window_size)
  current_max_range = nil
  all_windows = []
  arr.each_with_index do |el1,idx1|
    second_idx = idx1 + window_size -1
    break if second_idx > arr.length-1
    all_windows << arr[idx1..second_idx]
  end
  largest_max_range = 0
  all_windows.each do |window|
    diff = window.max - window.min
    largest_max_range = diff if diff > largest_max_range
  end
  largest_max_range

end

# [[1,2,3],[2,3,5]]

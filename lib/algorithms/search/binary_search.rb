def binary_search(arr, target, max=arr.length-1, min=0)
  
  return nil if min > max
  
  mid = (min+max) / 2

  if target == arr[mid]
    return mid
  elsif arr[mid] > target
    binary_search(arr, target, mid-1, min)
  elsif arr[mid] < target
    binary_search(arr, target, max, mid+1)
  end
end
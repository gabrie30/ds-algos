def quick_sort(arr)
    return arr if arr.length <= 1
    
    pivot = arr.pop
    left  = arr.select { |x| x < pivot }
    right = arr.select { |x| x > pivot }
    
    quick_sort(left) + [pivot] + quick_sort(right)
end


# == Time Complexity ==
# Best:     O(n log(n))
# Average:  O(n log(n))
# Worst:    O(n^2)
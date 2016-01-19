## Futher reading http://www.studytonight.com/data-structures/insertion-sorting

def insertion_sort(array)

  array.each_with_index do |el, idx|
    next if idx == 0

    temp_idx = idx-1

    while (temp_idx >= 0 && el < array[temp_idx])
      temp_idx -= 1
    end

    array.insert(temp_idx+1, array.delete_at(idx))
  end

array
end


# start on the second element in the array
# if the element before is greater than the current element, start moving back to see if there is something smaller
# while iterating backwards, if you hit an element that is smaller, insert after that element

# Worst Case Time Complexity : O(n**2)
# Best Case Time Complexity : O(n)
# Average Time Complexity : O(n**2)
# Space Complexity : O(1)
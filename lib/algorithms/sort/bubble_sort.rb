def bubble_sort(input)
  len = input.length
  not_sorted = true

  while not_sorted 
    i = 0
    not_sorted = false

    while i < len-1
      if input[i] > input[i+1]
        input[i], input[i+1] = input[i+1], input[i]
        not_sorted = true
      end
      i += 1
    end
    len -= 1
  end

  input
end

# Stable
# Constant auxiliary space
# Linear if sorted
# Insertion sort is better
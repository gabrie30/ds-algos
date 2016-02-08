def selection_sort(input)
  i = 0
  while i < input.length
      j = i+1
      while j < input.length
          if input[i] > input[j]
              input[i], input[j] = input[j], input[i]
          end
          j += 1
      end
      i += 1
  end
  input
end

# Constant auxiliary space
# Quadratic time at best
# Not Stable